import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/customer.dart';
import '../providers/customer_provider.dart';
import '../utils/theme.dart';

class EditCustomerDetailsScreen extends StatefulWidget {
  final Customer customer;

  const EditCustomerDetailsScreen({super.key, required this.customer});

  @override
  State<EditCustomerDetailsScreen> createState() =>
      _EditCustomerDetailsScreenState();
}

class _EditCustomerDetailsScreenState extends State<EditCustomerDetailsScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController = TextEditingController();
  late final TextEditingController _mobileController = TextEditingController();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _locationController =
      TextEditingController();
  late bool _smsConsent;
  bool _isLoading = false;
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _mobileController.text = widget.customer.mobile;
    _smsConsent = widget.customer.smsConsent;

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _buttonAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _nameController.text = widget.customer.name;
    _emailController.text = widget.customer.email;
    _locationController.text = widget.customer.location;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final displayName = widget.customer.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.editCustomer,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverToBoxAdapter(
              child: Card(
                elevation: theme.cardTheme.elevation ?? 2.0,
                shape:
                    theme.cardTheme.shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryBlue.withAlpha(26),
                                AppTheme.secondaryGreen.withAlpha(13),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: AppTheme.primaryBlue
                                    .withValues(alpha: 0.2),
                                child: Text(
                                  widget.customer.name.isNotEmpty
                                      ? widget.customer.name[0].toUpperCase()
                                      : '?',
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      displayName,
                                      style: theme.textTheme.headlineMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: theme.colorScheme.onSurface,
                                          ),
                                    ),
                                    Text(
                                      widget.customer.mobile,
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
                                            color: AppTheme.textSecondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          l10n.personalInfo,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppTheme.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: AppTheme.primaryBlue,
                            ),
                            hintText: l10n.fullName,
                          ),
                          validator: (value) =>
                              value?.isEmpty ?? true ? l10n.nameRequired : null,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.contactInfo,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppTheme.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _mobileController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: AppTheme.primaryBlue,
                            ),
                            hintText: l10n.mobileNumber,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) => value?.isEmpty ?? true
                              ? l10n.mobileRequired
                              : null,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppTheme.primaryBlue,
                            ),
                            hintText: l10n.emailOptional,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _locationController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: AppTheme.primaryBlue,
                            ),
                            hintText: l10n.locationOptional,
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 24),
                        Divider(color: theme.dividerColor, thickness: 1.5),
                        const SizedBox(height: 24),
                        Text(
                          l10n.preferences,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppTheme.primaryBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SwitchListTile(
                          title: Text(
                            l10n.receiveSMSNotifications,
                            style: theme.textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            l10n.stayUpdatedOnPayments,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          value: _smsConsent,
                          activeThumbColor: AppTheme.secondaryGreen,
                          onChanged: (value) =>
                              setState(() => _smsConsent = value),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AnimatedBuilder(
                  animation: _buttonAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _buttonAnimation.value,
                      child: ElevatedButton.icon(
                        onPressed: _isLoading ? null : _updateCustomer,
                        icon: _isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.colorScheme.onPrimary,
                                  ),
                                ),
                              )
                            : const Icon(Icons.save_outlined),
                        label: Text(
                          _isLoading ? l10n.updating : l10n.updateCustomer,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateCustomer() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      _buttonController.repeat(reverse: true);

      await Future.delayed(const Duration(milliseconds: 800));

      final updatedCustomer = Customer(
        id: widget.customer.id,
        name: _nameController.text.trim(),
        mobile: _mobileController.text.trim(),
        email: _emailController.text.trim().isEmpty
            ? ''
            : _emailController.text.trim(),
        location: _locationController.text.trim().isEmpty
            ? ''
            : _locationController.text.trim(),
        smsConsent: _smsConsent,
      );

      try {
        Provider.of<CustomerProvider>(
          // ignore: use_build_context_synchronously
          context,
          listen: false,
        ).updateCustomer(widget.customer.id, updatedCustomer);

        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white),
                  const SizedBox(width: 12),
                  Text(l10n.customerUpdatedSuccessfully),
                ],
              ),
              backgroundColor: AppTheme.secondaryGreen,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
            ),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: $e')));
        }
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _buttonController.dispose();
    super.dispose();
  }
}
