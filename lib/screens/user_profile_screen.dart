import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../l10n/app_localizations.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../../utils/theme.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;
  bool _isSettingLocalizedControllers = false;
  bool _isPickingImage = false;
  String? _profileImagePath;
  bool _hasValidImage = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final ImagePicker _picker = ImagePicker();

  Future<void> _validateProfileImage() async {
    if (_profileImagePath == null) {
      if (mounted) setState(() => _hasValidImage = false);
      debugPrint('[PROFILE] No profile path');
      return;
    }
    try {
      final file = File(_profileImagePath!);
      final exists = await file.exists();
      debugPrint(
        '[PROFILE] Path: $_profileImagePath, exists: $exists, size: ${exists ? await file.length() : 'N/A'}',
      );
      if (mounted) setState(() => _hasValidImage = exists);
    } catch (e) {
      debugPrint('[PROFILE] Validate error: $e');
      if (mounted) setState(() => _hasValidImage = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _animationController.forward();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    await LoanService.reloadData();
    await CustomerService.reloadData();
    final prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('lenderName') ?? '';
    _mobileController.text = prefs.getString('lenderMobile') ?? '';
    _emailController.text = prefs.getString('lenderEmail') ?? '';
    _locationController.text = prefs.getString('lenderLocation') ?? '';
    _profileImagePath = prefs.getString('profileImagePath');
    await _validateProfileImage();
    if (mounted) {
      setState(() => _isLoading = false);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _localizeEditableValues();
        }
      });
    }
  }

  void _localizeEditableValues() {
    if (_isSettingLocalizedControllers) return;
    _isSettingLocalizedControllers = true;
    _nameController.value = _localizedControllerValue(_nameController);
    _emailController.value = _localizedControllerValue(_emailController);
    _locationController.value = _localizedControllerValue(_locationController);
    _isSettingLocalizedControllers = false;
  }

  TextEditingValue _localizedControllerValue(TextEditingController controller) {
    return TextEditingValue(
      text: controller.text,
      selection: TextSelection.collapsed(offset: controller.text.length),
    );
  }

  Future<bool> _requestPermissions(ImageSource source) async {
    final l10n = AppLocalizations.of(context)!;
    Permission permission;
    if (source == ImageSource.camera) {
      permission = Permission.camera;
    } else {
      if (Platform.isAndroid) {
        try {
          final deviceInfo = DeviceInfoPlugin();
          final androidInfo = await deviceInfo.androidInfo;
          if (androidInfo.version.sdkInt < 33) {
            permission = Permission.storage;
          } else {
            permission = Permission.photos;
          }
        } catch (e) {
          permission = Permission.storage;
        }
      } else {
        permission = Permission.photos;
      }
    }

    var status = await permission.status;
    if (status.isDenied) {
      final granted = await _showPermissionRationale(permission);
      if (granted == true) {
        status = await permission.request();
      } else {
        return false;
      }
    }

    if (status.isDenied) {
      _showSnackBar(
        'Permission denied for ${source == ImageSource.camera ? l10n.camera.toLowerCase() : l10n.gallery.toLowerCase()}. Cannot proceed.',
        isError: true,
      );
      return false;
    }

    if (status.isPermanentlyDenied) {
      _showPermissionDialog(
        '${source == ImageSource.camera ? l10n.camera : l10n.gallery} access permanently denied. Please enable in Settings.',
      );
      return false;
    }

    return true;
  }

  Future<bool?> _showPermissionRationale(Permission permission) async {
    final l10n = AppLocalizations.of(context)!;
    final isCamera = permission == Permission.camera;
    final title = isCamera
        ? '${l10n.camera} Access Required'
        : '${l10n.gallery} Access Required';
    final message = isCamera
        ? '${l10n.camera} permission is needed to take a new profile photo.'
        : '${l10n.gallery} permission is needed to select a profile photo from your gallery.';

    if (!mounted) return false;
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.allow),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_isPickingImage) return;
    _isPickingImage = true;
    try {
      if (!await _requestPermissions(source)) {
        _isPickingImage = false;
        return;
      }

      debugPrint('[_pickImage] Picking from $source');
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile == null) {
        _showSnackBar('No image selected. Please try again.', isError: true);
        _isPickingImage = false;
        return;
      }

      // Validate file accessibility
      if (!File(pickedFile.path).existsSync()) {
        _showSnackBar('Selected image file not accessible.', isError: true);
        _isPickingImage = false;
        return;
      }

      debugPrint('[_pickImage] Picked image: ${pickedFile.path}');

      // Create a temporary file for cropping
      final tempDir = await getTemporaryDirectory();
      final tempFilePath = path.join(
        tempDir.path,
        'temp_crop_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      final tempFile = File(tempFilePath);

      // Safer byte read with size check
      final originalBytes = await pickedFile.readAsBytes();
      if (originalBytes.length > 5 * 1024 * 1024) {
        // 5MB temp limit
        _showSnackBar('Image too large for processing.', isError: true);
        _isPickingImage = false;
        return;
      }
      await tempFile.writeAsBytes(originalBytes);

      CroppedFile? croppedFile;
      try {
        croppedFile = await ImageCropper().cropImage(
          sourcePath: tempFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Crop Profile Photo',
              toolbarColor: AppTheme.primaryBlue,
              toolbarWidgetColor: Colors.white,
              lockAspectRatio: true,
            ),
          ],
        );
      } catch (cropError, stackTrace) {
        debugPrint(
          '[_pickImage] Crop error: $cropError\n$stackTrace. Using original.',
        );
      } finally {
        // Clean up temporary file
        if (await tempFile.exists()) {
          await tempFile.delete();
        }
      }

      final imageToSave = croppedFile != null
          ? croppedFile.path
          : pickedFile.path;

      // ** NEW: Check file size before saving **
      final File tempSavedFile = File(imageToSave);
      final int fileSizeBytes = await tempSavedFile.length();
      final double fileSizeMB = fileSizeBytes / (1024 * 1024);
      if (fileSizeMB > 2) {
        _showSnackBar(
          'Image too large (${fileSizeMB.toStringAsFixed(1)} MB). Please choose a smaller image (max 2 MB).',
          isError: true,
        );
        _isPickingImage = false;
        return;
      }

      await _saveProfileImage(imageToSave);
    } catch (e, stackTrace) {
      debugPrint('[_pickImage] Error: $e\n$stackTrace');
      _showSnackBar('Failed to pick image: ${e.toString()}', isError: true);
    } finally {
      // Always reset the flag at the end, regardless of success or failure
      _isPickingImage = false;
    }
  }

  Future<void> _saveProfileImage(String imagePath) async {
    try {
      debugPrint('[_saveProfileImage] Getting directory...');
      final directory = await getApplicationDocumentsDirectory();
      debugPrint('[_saveProfileImage] Directory OK: ${directory.path}');
      final String fileName =
          'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String newPath = path.join(directory.path, fileName);

      // Read bytes safely (handles both file paths and content URIs)
      final XFile sourceFile = XFile(imagePath);
      final bytes = await sourceFile.readAsBytes();

      debugPrint('[_saveProfileImage] Bytes read: ${bytes.length} bytes');
      if (bytes.isEmpty) {
        throw Exception('Image file is empty');
      }
      if (bytes.length > 2 * 1024 * 1024) {
        // 2 MB limit
        throw Exception(
          'Image too large: ${(bytes.length / 1024 / 1024).toStringAsFixed(1)} MB',
        );
      }

      await File(newPath).writeAsBytes(bytes);
      debugPrint('[_saveProfileImage] Bytes written to $newPath');

      final savedFile = File(newPath);
      if (!await savedFile.exists()) {
        throw Exception('Failed to save image file');
      }

      debugPrint('[_saveProfileImage] Saved to: $newPath');

      // Free memory by clearing bytes
      // (bytes variable will be garbage collected)

      if (mounted) {
        setState(() {
          _profileImagePath = newPath;
        });
        debugPrint('[_saveProfileImage] setState called');
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImagePath', newPath);

      await _validateProfileImage();

      if (mounted) {
        _showSnackBar('Profile photo updated successfully!', isError: false);
      }
    } catch (e, stackTrace) {
      debugPrint('[_saveProfileImage] Error: $e\n$stackTrace');
      _showSnackBar('Failed to save image: ${e.toString()}', isError: true);
    }
  }

  void _showPermissionDialog(String message) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.permissionRequired),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(l10n.openSettings),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message, {required bool isError}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error : Icons.check_circle,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: isError ? Colors.red : AppTheme.primaryBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showImagePickerOptions() {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '${l10n.myProfile} Photo',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.photo_library,
                color: AppTheme.primaryBlue,
              ),
              title: Text(l10n.gallery),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.camera_alt,
                color: AppTheme.primaryBlue,
              ),
              title: Text(l10n.camera),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.close, color: Colors.red),
              title: Text(l10n.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateProfile() async {
    final l10n = AppLocalizations.of(context)!;
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lenderName', _nameController.text.trim());
      await prefs.setString('lenderMobile', _mobileController.text.trim());
      await prefs.setString('lenderEmail', _emailController.text.trim());
      await prefs.setString('lenderLocation', _locationController.text.trim());
      if (_profileImagePath != null) {
        await prefs.setString('profileImagePath', _profileImagePath!);
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Text('${l10n.myProfile} updated successfully!'),
              ],
            ),
            backgroundColor: AppTheme.secondaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  Future<void> _confirmLogout() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(AppLocalizations.of(context)!.logout),
        content: Text(AppLocalizations.of(context)!.logoutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child:  Text(AppLocalizations.of(context)!.logout),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _logout();
    }
  }

  int _getTotalLoans() => LoanService().getLoans().length;

  int _getTotalCustomers() => CustomerService().getCustomers().length;

  int _getActiveLoansCount() {
    final now = DateTime.now();
    return LoanService()
        .getLoans()
        .where(
          (loan) =>
              loan.startDate.isBefore(now) &&
              loan.endDate.isAfter(now) &&
              !LoanService().isLoanCompleted(loan.id),
        )
        .length;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _localizeEditableValues();
        }
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(l10n.myProfile),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryBlue,
                AppTheme.primaryBlue.withValues(alpha: 0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.primaryBlue.withValues(alpha: 0.05),
              theme.scaffoldBackgroundColor,
            ],
          ),
        ),
        child: _isLoading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: AppTheme.primaryBlue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Loading ${l10n.myProfile.toLowerCase()}...',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: _loadProfileData,
                color: AppTheme.primaryBlue,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: kToolbarHeight + 32),
                        ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            padding: const EdgeInsets.all(32.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                colors: [
                                  AppTheme.primaryBlue,
                                  AppTheme.secondaryGreen,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryBlue.withValues(
                                    alpha: 0.4,
                                  ),
                                  blurRadius: 25,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            AppTheme.primaryBlue,
                                            AppTheme.secondaryGreen,
                                          ],
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.primaryBlue
                                                .withValues(alpha: 0.4),
                                            blurRadius: 25,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 55,
                                        backgroundColor: Colors.white,
                                        backgroundImage: _hasValidImage
                                            ? FileImage(
                                                File(_profileImagePath!),
                                              )
                                            : null,
                                        child: _hasValidImage
                                            ? null
                                            : const Icon(
                                                Icons.person,
                                                size: 60,
                                                color: Color(0xFF1A73E8),
                                              ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: _showImagePickerOptions,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.2,
                                                ),
                                                blurRadius: 4,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            size: 20,
                                            color: AppTheme.primaryBlue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  _nameController.text.isNotEmpty
                                      ? _nameController.text
                                      : l10n.fullName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                 Text(
                                  AppLocalizations.of(context)!.loanManagementProfessional,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildStatCard(
                                      l10n.totalLoans,
                                      _getTotalLoans().toString(),
                                      Icons.trending_up,
                                    ),
                                    _buildStatCard(
                                      l10n.customers,
                                      _getTotalCustomers().toString(),
                                      Icons.people,
                                    ),
                                    _buildStatCard(
                                      l10n.active,
                                      _getActiveLoansCount().toString(),
                                      Icons.check_circle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          AppLocalizations.of(context)!.accountDetails,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                _buildFormField(
                                  context,
                                  Icons.person,
                                  l10n.fullName,
                                  _nameController,
                                  (value) => value?.isEmpty ?? true
                                      ? l10n.nameRequired
                                      : null,
                                ),
                                const SizedBox(height: 20),
                                _buildFormField(
                                  context,
                                  Icons.phone,
                                  l10n.mobileNumber,
                                  _mobileController,
                                  (value) {
                                    if (value?.isEmpty ?? true) {
                                      return l10n.mobileRequired;
                                    }
                                    if (value!.length != 10 ||
                                        !RegExp(r'^\d{10}$').hasMatch(value)) {
                                      return l10n.enterValidMobileNumber;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                                const SizedBox(height: 20),
                                _buildFormField(
                                  context,
                                  Icons.email,
                                  l10n.email,
                                  _emailController,
                                  (value) {
                                    if (value?.isEmpty ?? true) {
                                      return l10n.pleaseEnterEmail;
                                    }
                                    if (!RegExp(
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                    ).hasMatch(value!)) {
                                      return l10n.enterValidEmail;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),
                                _buildFormField(
                                  context,
                                  Icons.location_on,
                                  l10n.location,
                                  _locationController,
                                  (value) => value?.isEmpty ?? true
                                      ? l10n.pleaseEnterLocation
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed: _isSaving ? null : _updateProfile,
                            icon: _isSaving
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(Icons.save, size: 24),
                            label: Text(
                              _isSaving ? l10n.saving : l10n.updateProfile,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryBlue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shadowColor: AppTheme.primaryBlue.withValues(
                                alpha: 0.4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextButton.icon(
                          onPressed: _confirmLogout,
                          icon: const Icon(Icons.logout, color: Colors.red),
                          label: Text(
                            l10n.logout,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.25),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildFormField(
    BuildContext context,
    IconData icon,
    String label,
    TextEditingController controller,
    String? Function(String?) validator, {
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: theme.colorScheme.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.outline, width: 1),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      ),
      style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurface,
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
