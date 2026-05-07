import 'package:flutter/material.dart';
import 'package:loan_management_app/l10n/app_localizations.dart';
import 'package:path/path.dart' as path;
import '../../models/loan.dart';
import '../../models/customer.dart';
import '../../models/emi_schedule.dart';
import '../../services/loan_service.dart';
import '../../services/customer_service.dart';
import '../../services/pdf_service.dart';
import '../../services/app_services.dart';
import 'dart:io'; // For File operations

class EditPDFScreen extends StatefulWidget {
  final String loanId;
  final String pdfPath;

  const EditPDFScreen({super.key, required this.loanId, required this.pdfPath});

  @override
  State<EditPDFScreen> createState() => _EditPDFScreenState();
}

class _EditPDFScreenState extends State<EditPDFScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoanService _loanService = LoanService();
  final CustomerService _customerService = CustomerService();

  Loan? _loan;
  Customer? _customer;
  List<EMISchedule> _emis = [];
  bool _isLoading = true;

  late TextEditingController _amountController;
  late TextEditingController _interestController;
  late TextEditingController _tenureController;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;

  String _interestType = 'simple';

  @override
  void initState() {
    super.initState();
    _loadData();
    _amountController = TextEditingController();
    _interestController = TextEditingController();
    _tenureController = TextEditingController();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _emailController = TextEditingController();
    _locationController = TextEditingController();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      // Fix: Reload ALL services (ensures customer + EMI status sync)
      await AppServices.reloadAll();
      _loan = _loanService.getLoanById(widget.loanId);
      _customer = _loan != null
          ? _customerService.getCustomerById(_loan!.customerId)
          : null;
      _emis = _loanService.getEMISchedulesByLoan(widget.loanId);
      debugPrint(
        '📊 Loaded ${_emis.length} EMIs, Pending: ${_emis.where((e) => !e.isPaid).length}',
      ); // Debug

      if (_loan != null && _customer != null) {
        _amountController.text = _loan!.amount.toString();
        _interestController.text = _loan!.interestRate.toString();
        _tenureController.text = _loan!.tenure.toString();
        _interestType = _loan!.interestType;
        _nameController.text = _customer!.name;
        _mobileController.text = _customer!.mobile;
        _emailController.text = _customer!.email;
        _locationController.text = _customer!.location;
      }
    } catch (e) {
      debugPrint('Load data error: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _saveAndRegenerate() async {
    if (!_formKey.currentState!.validate()) return;
    if (_loan == null || _customer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot save: Loan or customer data missing.'),
        ),
      );
      return;
    }

    try {
      setState(() => _isLoading = true);

      // Update loan
      final double newAmount = double.parse(_amountController.text);
      final double newInterestRate = double.parse(_interestController.text);
      final int newTenure = int.parse(_tenureController.text);
      final double newEmi = _loanService.calculateEMI(
        newAmount,
        newInterestRate,
        newTenure,
        _interestType,
      );

      final updatedLoan = Loan(
        id: widget.loanId,
        customerId: _loan!.customerId,
        amount: newAmount,
        interestRate: newInterestRate,
        tenure: newTenure,
        interestType: _interestType,
        startDate: _loan!.startDate,
        endDate: _loan!.endDate,
        emi: newEmi,
      );
      await _loanService.updateLoan(widget.loanId, updatedLoan);

      // Fix: Reload ALL services for EMI + customer sync
      await AppServices.reloadAll();
      _emis = _loanService.getEMISchedulesByLoan(widget.loanId);
      debugPrint(
        '✅ PDF Generation - Pending EMIs: ${_emis.where((e) => !e.isPaid).length}',
      ); // Debug

      // Fix: Delete old PDF before regeneration (cache busting)
      final oldPdfFile = File(widget.pdfPath);
      if (await oldPdfFile.exists()) {
        await oldPdfFile.delete();
        debugPrint('🗑️ Deleted old PDF: ${widget.pdfPath}');
      }

      // Update customer
      final updatedCustomer = Customer(
        id: _customer!.id,
        name: _nameController.text,
        mobile: _mobileController.text,
        email: _emailController.text,
        location: _locationController.text,
      );
      await _customerService.updateCustomer(_customer!.id, updatedCustomer);

      // Regenerate PDF with fresh EMIs
      await PDFService.generateLoanCompletionPDF(
        updatedLoan,
        updatedCustomer,
        _emis,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('PDF updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error updating PDF: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editPDF),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
            tooltip: 'Refresh Data',
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading loan data...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          : Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      child: Column(
                        children: [
                          // Gradient header bar
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.picture_as_pdf,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  size: 28,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Edit PDF Details',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        path.basename(widget.pdfPath),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary
                                                  .withValues(alpha: 0.8),
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Chip(
                                  label: Text('Loan ID: ${widget.loanId}'),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 12),
                                if (_loan == null) ...[
                                  Chip(
                                    label: const Text('Loan data not found'),
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.errorContainer,
                                    avatar: Icon(
                                      Icons.warning,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onErrorContainer,
                                      size: 18,
                                    ),
                                  ),
                                ],
                                if (_customer == null) ...[
                                  const SizedBox(height: 8),
                                  Chip(
                                    label: const Text(
                                      'Customer data not found',
                                    ),
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.errorContainer,
                                    avatar: Icon(
                                      Icons.person_off,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onErrorContainer,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Loan Details Card
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  AppLocalizations.of(context)!.loanDetails,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _amountController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(
                                  context,
                                )!.loanAmount,
                                prefixIcon: Icon(
                                  Icons.currency_rupee,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                helperText: 'Enter principal amount',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                              ),
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _interestController,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.interestRate,
                                      prefixIcon: Icon(
                                        Icons.percent,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: Text(
                                          '%',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                      ),
                                      helperText: 'Annual interest rate',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest
                                          .withValues(alpha: 0.5),
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                        ? 'Required'
                                        : null,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextFormField(
                                    controller: _tenureController,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(
                                        context,
                                      )!.tenure,
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 12,
                                        ),
                                        child: Text(
                                          'months',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onSurfaceVariant,
                                              ),
                                        ),
                                      ),
                                      helperText: 'Loan duration in months',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Theme.of(context)
                                          .colorScheme
                                          .surfaceContainerHighest
                                          .withValues(alpha: 0.5),
                                    ),
                                    keyboardType: TextInputType.number,
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                        ? 'Required'
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            DropdownButtonFormField<String>(
                              initialValue: _interestType,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(
                                  context,
                                )!.interestType,
                                prefixIcon: Icon(
                                  Icons.calculate,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                helperText: 'Select interest calculation type',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                              ),
                               items: [
                                DropdownMenuItem(
                                  value: 'simple',
                                  child: Text(AppLocalizations.of(context)!.simpleInterest),
                                ),
                                DropdownMenuItem(
                                  value: 'compound',
                                  child: Text(AppLocalizations.of(context)!.compoundInterest),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _interestType = newValue ?? 'simple';
                                });
                              },
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Please select interest type'
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Customer Details Card
                    Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
Text(AppLocalizations.of(context)!.customerDetails, style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(
                                  context,
                                )!.fullName,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                helperText: 'Customer full name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                              ),
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _mobileController,
                              decoration: InputDecoration(
labelText: AppLocalizations.of(context)!.mobileNumber,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                helperText: '10 digit phone number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                filled: true,
                                fillColor: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
labelText: AppLocalizations.of(context)!.emailOptional,
                                prefixIcon: const Icon(Icons.email),
                                helperText: 'For notifications',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _locationController,
                              decoration: InputDecoration(
labelText: AppLocalizations.of(context)!.location,
                                prefixIcon: const Icon(Icons.location_on),
                                helperText: 'City or address',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: ElevatedButton.icon(
                        onPressed: _isLoading ? null : _saveAndRegenerate,
                        icon: _isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  strokeWidth: 2,
                                ),
                              )
                            : Icon(Icons.picture_as_pdf),
                        label: Text(
                          _isLoading
                          ? AppLocalizations.of(context)!.regeneratingPDF                              : AppLocalizations.of(context)!.saveAndRegeneratePDF,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          elevation: 2,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _interestController.dispose();
    _tenureController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
