import 'dart:io';
import 'package:flutter/material.dart';
import 'package:loan_management_app/l10n/app_localizations.dart';
import 'package:loan_management_app/models/loan.dart';
import 'package:loan_management_app/models/customer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../services/pdf_service.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/theme.dart';
import 'edit_pdf_screen.dart';

class _PdfItem {
  final File file;
  final String? loanId;
  final Loan? loan;
  final Customer? customer;

  _PdfItem({required this.file, this.loanId, this.loan, this.customer});
}

class _PdfGroup {
  final String key;
  final String customerName;
  final String mobileNumber;
  final List<_PdfItem> items;

  _PdfGroup({
    required this.key,
    required this.customerName,
    required this.mobileNumber,
    required this.items,
  });
}

class AllPDFScreen extends StatefulWidget {
  const AllPDFScreen({super.key});

  @override
  State<AllPDFScreen> createState() => _AllPDFScreenState();
}

class _AllPDFScreenState extends State<AllPDFScreen>
    with TickerProviderStateMixin {
  bool _isDeleting = false; // Track delete state
  final LoanService _loanService = LoanService();
  final CustomerService _customerService = CustomerService();
  Key? _futureKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initServices();
  }

  Future<void> _initServices() async {
    await LoanService.init();
    await CustomerService.init();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return PopScope(
      canPop: !_isDeleting,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.allLoanPDFs,
            style: theme.appBarTheme.titleTextStyle,
          ),
          elevation: 0,
          backgroundColor: AppTheme.primaryBlue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => setState(() => _futureKey = GlobalKey()),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => setState(() => _futureKey = GlobalKey()),
          child: FutureBuilder<List<_PdfGroup>>(
            key: _futureKey,
            future: _getPDFGroups(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final groups = snapshot.data ?? [];
              if (groups.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.picture_as_pdf_outlined,
                        size: 80,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        l10n.noLoanCompletionPDFs,
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: groups.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) => _buildGroupCard(groups[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<List<_PdfItem>> _getPDFItems() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final pdfDirPath = path.join(dir.path, 'loan_pdfs');
      final pdfDir = Directory(pdfDirPath);
      if (!await pdfDir.exists()) {
        debugPrint('PDF directory not found: $pdfDirPath');
        return [];
      }

      final entities = await pdfDir.list().toList();
      final files = entities
          .whereType<File>()
          .where((f) => path.extension(f.path).toLowerCase() == '.pdf')
          .where(
            (f) =>
                path.basename(f.path).startsWith('loan_') &&
                path.basename(f.path).endsWith('_completion.pdf'),
          )
          .toList();

      debugPrint('Found ${files.length} PDF files in $pdfDirPath');

      files.sort(
        (a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()),
      );

      final List<_PdfItem> items = [];
      for (final file in files) {
        final filename = path.basename(file.path);
        final loanIdMatch = RegExp(
          r'loan_(.+?)_completion\.pdf',
        ).firstMatch(filename);
        final loanId = loanIdMatch?.group(1);
        Loan? loan;
        Customer? customer;
        if (loanId != null) {
          loan = _loanService.getLoanById(loanId);
          if (loan != null) {
            customer = _customerService.getCustomerById(loan.customerId);
          }
        }
        items.add(
          _PdfItem(file: file, loanId: loanId, loan: loan, customer: customer),
        );
      }
      return items;
    } catch (e, st) {
      debugPrint('Error fetching PDFs: $e\n$st');
      return [];
    }
  }

  Future<List<_PdfGroup>> _getPDFGroups() async {
    final items = await _getPDFItems();
    final Map<String, List<_PdfItem>> tempGroups = {};
    for (final item in items) {
      final mobile = item.customer?.mobile ?? (item.loanId ?? 'unknown');
      tempGroups.putIfAbsent(mobile, () => []).add(item);
    }

    final List<_PdfGroup> groups = [];
    final sortedKeys = tempGroups.keys.toList()
      ..sort((a, b) {
        final nameA = _customerService.getCustomerByMobile(a)?.name ?? a;
        final nameB = _customerService.getCustomerByMobile(b)?.name ?? b;
        return nameA.toLowerCase().compareTo(nameB.toLowerCase());
      });
    for (final key in sortedKeys) {
      final groupItems = tempGroups[key]!;
      final customer = _customerService.getCustomerByMobile(key);
      final customerName =
          // ignore: use_build_context_synchronously
          customer?.name ?? AppLocalizations.of(context)!.unknownCustomer;
      final mobileNumber = customer?.mobile ?? key;
      groups.add(
        _PdfGroup(
          key: key,
          customerName: customerName,
          mobileNumber: mobileNumber,
          items: groupItems,
        ),
      );
    }
    return groups;
  }

  Widget _buildGroupCard(_PdfGroup group) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.withValues(alpha: 0.1), Colors.red.shade50],
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.folder, color: Colors.red, size: 28),
        ),
        title: Text(
          group.customerName,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.phone, size: 16, color: Colors.grey),
            const SizedBox(width: 8),
            Text(
              group.mobileNumber,
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${group.items.length} PDFs',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        iconColor: AppTheme.primaryBlue,
        collapsedIconColor: AppTheme.primaryBlue,
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        childrenPadding: const EdgeInsets.fromLTRB(72, 12, 20, 12),
        children: [
          ...group.items.map((item) => _buildPDFCard(item)),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.grey, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.tapPDFToShareViaWhatsApp,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPDFCard(_PdfItem item) {
    final theme = Theme.of(context);
    final filename = path.basename(item.file.path);
    final customer = item.customer;
    final mobile = customer?.mobile ?? '';
    final isRecent =
        DateTime.now().difference(item.file.lastModifiedSync()).inDays < 7;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        dense: true,
        leading: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
                size: 24,
              ),
            ),
            if (isRecent)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.fiber_new,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          filename.replaceAll('_completion.pdf', '').replaceFirst('loan_', ''),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: customer != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer.name,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  Text(
                    customer.mobile,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  Text(
                    item.file.lastModifiedSync().toString().split(' ')[0],
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            : Text(
                item.loanId ?? AppLocalizations.of(context)!.unknown,
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
        trailing: PopupMenuButton<String>(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          offset: const Offset(-8, 40),
          itemBuilder: (context) => [
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                Navigator.pop(context);
                _savePDF(item.file);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.download,
                      size: 20,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.saveToDownloads),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                Navigator.pop(context);
                _sharePDF(item.file, mobile);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.share,
                      size: 20,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.shareViaWhatsApp),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                Navigator.pop(context);
                _editPDF(item.file);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.editPDF),
                ],
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                Navigator.pop(context);
                _deletePDF(item.file);
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppLocalizations.of(context)!.delete,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () => _sharePDF(item.file, mobile),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Future<void> _savePDF(File file) async {
    // Storage permission needed for downloads
    final hasPermission = await _requestFilePermissions();
    if (!hasPermission) return;

    final success = await PDFService.savePDFToDownloads(file);
    if (!success && mounted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.failedToSavePDF),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  void _sharePDF(File file, String mobile) {
    PDFService.sharePDFViaWhatsApp(file, mobile).catchError((e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Share failed: $e')));
      }
    });
  }

  Future<bool> _requestFilePermissions() async {
    if (!Platform.isAndroid) return true;

    // Updated for Android 13+: Use manageExternalStorage for downloads
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      status = await Permission.manageExternalStorage.request();
    }

    if (status.isPermanentlyDenied && mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.storagePermissionRequired),
          content: const Text(
            'Manage External Storage permission needed to save to Downloads.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      );
      return false;
    }
    return status.isGranted;
  }

  void _editPDF(File file) async {
    final filename = path.basename(file.path);
    final loanIdMatch = RegExp(
      r'loan_(.+?)_completion\.pdf',
    ).firstMatch(filename);
    if (loanIdMatch?.group(1) == null || loanIdMatch!.group(1)!.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.cannotEditInvalidFormat(filename),
            ),
          ),
        );
      }
      return;
    }
    final loanId = loanIdMatch.group(1)!;
    final testLoan = _loanService.getLoanById(loanId);
    if (testLoan == null && mounted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.loanNotFoundCannotEdit(loanId),
            ),
            backgroundColor: Colors.orange,
          ),
        );
      }
      return;
    }
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              EditPDFScreen(loanId: loanId, pdfPath: file.path),
        ),
      ).then((_) => setState(() => _futureKey = GlobalKey()));
    }
  }

  void _showSuccessPopup() {
    final animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    final scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );
    animationController.forward();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: scaleAnimation.value,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 320,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.secondaryGreen.withValues(alpha: 0.95),
                    AppTheme.accentGreen.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.secondaryGreen.withValues(alpha: 0.4),
                    blurRadius: 30,
                    spreadRadius: 2,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 1000),
                    builder: (context, value, child) => Transform.rotate(
                      angle: value * 2 * 3.14159,
                      child: const Icon(
                        Icons.check_circle,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.pdfDeletedSuccessfully,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.fileRemovedFromStorage,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        animationController.dispose();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, size: 18),
                      label: Text(
                        AppLocalizations.of(context)!.gotIt,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && animationController.status == AnimationStatus.forward) {
        animationController.dispose();
        Navigator.of(context, rootNavigator: true).pop();
      }
    });
  }

  Future<void> _deletePDF(File file) async {
    final filename = path.basename(file.path);

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              AppLocalizations.of(context)!.deletePDF,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.permanentlyDeleteWarning,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                filename,
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.actionCannotBeUndone,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.delete, size: 18),
            label: Text(AppLocalizations.of(context)!.delete),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;

    setState(() => _isDeleting = true);

    debugPrint('🗑️ DELETE START: ${file.path}');

    bool success = false;
    for (int attempt = 1; attempt <= 3; attempt++) {
      try {
        debugPrint('🗑️ Attempt $attempt/3: deleting ${file.path}');
        final deleted = await file.delete();
        debugPrint('🗑️ delete() returned: $deleted');

        await Future.delayed(Duration(milliseconds: 150 * attempt));

        final exists = await file.exists();
        debugPrint('🗑️ Attempt $attempt exists(): $exists');

        if (!exists) {
          success = true;
          debugPrint('🗑️ ✅ SUCCESS after $attempt attempts');
          break;
        }
      } catch (e, st) {
        debugPrint('🗑️ Attempt $attempt FAILED: $e\n$st');
      }
    }

    if (mounted) {
      setState(() => _isDeleting = false);

      if (success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() => _futureKey = GlobalKey());
          debugPrint('🗑️ 🔄 List refreshed');
        });
        _showSuccessPopup();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Delete failed - file may be locked/open. Try refresh.',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Refresh',
              onPressed: () => setState(() => _futureKey = GlobalKey()),
            ),
          ),
        );
      }
    }
  }
}
