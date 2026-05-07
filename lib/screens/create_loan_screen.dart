import 'package:flutter/material.dart';
import 'package:loan_management_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../models/loan.dart';
import '../models/customer.dart';
import '../providers/loan_provider.dart';
import '../providers/customer_provider.dart';
import '../utils/theme.dart';
import '../utils/calculations.dart';
import '../utils/navigation_key.dart';
import '../main.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'overview_loans_screen.dart';
import 'add_customer_screen.dart';

class CreateLoanScreen extends StatefulWidget {
  const CreateLoanScreen({super.key});

  @override
  CreateLoanScreenState createState() => CreateLoanScreenState();
}

class CreateLoanScreenState extends State<CreateLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _interestRateController = TextEditingController();
  final _tenureController = TextEditingController();
  final _searchController = TextEditingController();
  String? _selectedCustomerId;
  String _interestType = 'simple';
  List<Customer> _customers = [];
  List<Customer> _filteredCustomers = [];
  double _calculatedEMI = 0.0;

  @override
  void initState() {
    super.initState();
    _loadCustomers();
    _searchController.addListener(_filterCustomers);
    _amountController.addListener(_calculateEMI);
    _interestRateController.addListener(_calculateEMI);
    _tenureController.addListener(_calculateEMI);
  }

  void _loadCustomers() {
    _customers = Provider.of<CustomerProvider>(
      context,
      listen: false,
    ).customers;
    _filteredCustomers = _customers;
    setState(() {});
  }

  void _filterCustomers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCustomers = _customers.where((customer) {
        return customer.mobile.toLowerCase().contains(query) ||
            customer.name.toLowerCase().contains(query);
      }).toList();

      // Auto-select customer if mobile number matches exactly
      final exactMobileMatch = _customers.firstWhere(
        (customer) => customer.mobile == query,
        orElse: () =>
            Customer(id: '', name: '', mobile: '', email: '', location: ''),
      );
      if (exactMobileMatch.id.isNotEmpty) {
        _selectedCustomerId = exactMobileMatch.id;
      }
    });
  }

  void _calculateEMI() {
    if (_amountController.text.isNotEmpty &&
        _interestRateController.text.isNotEmpty &&
        _tenureController.text.isNotEmpty) {
      try {
        final amount = double.parse(_amountController.text);
        final rate = double.parse(_interestRateController.text);
        final tenure = int.parse(_tenureController.text);
        setState(() {
          _calculatedEMI = Calculations.calculateEMI(
            amount,
            rate,
            tenure,
            _interestType,
          );
        });
      } catch (e) {
        setState(() {
          _calculatedEMI = 0.0;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.createLoanTitle), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle, size: 32.0, color: Colors.white),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.createLoanTitle,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          l10n.createLoanSubtitle,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),

            // Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Customer Selection
                  _buildSearchField(),
                  const SizedBox(height: 20.0),
                  _buildCustomerDropdown(),
                  const SizedBox(height: 20.0),

                  // Loan Details
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _amountController,
                          label: l10n.loanAmount,
                          hint: l10n.enterAmount,
                          icon: Icons.currency_rupee,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.requiredField;
                            }
                            if (double.tryParse(value) == null ||
                                double.parse(value) <= 0) {
                              return l10n.invalidAmount;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: _buildTextField(
                          controller: _interestRateController,
                          label: l10n.monthlyInterestRate,
                          hint: l10n.exampleInterestRate,
                          icon: Icons.percent,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.requiredField;
                            }
                            if (double.tryParse(value) == null ||
                                double.parse(value) < 0) {
                              return l10n.invalidRate;
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),

                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _tenureController,
                          label: l10n.tenureMonths,
                          hint: l10n.exampleTenure,
                          icon: Icons.calendar_today,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l10n.requiredField;
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) <= 0) {
                              return l10n.invalidTenure;
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: _buildDropdownField(
                          value: _interestType,
                          label: l10n.interestType,
                          icon: Icons.calculate,
                          items: [
                            DropdownMenuItem(
                              value: 'simple',
                              child: Text(l10n.simple),
                            ),
                            DropdownMenuItem(
                              value: 'compound',
                              child: Text(l10n.compound),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _interestType = value!;
                              _calculateEMI();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),

                  // EMI Calculator
                  if (_calculatedEMI > 0)
                    Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: AppTheme.secondaryGreen.withValues(alpha: 0.1),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calculate,
                              color: AppTheme.secondaryGreen,
                              size: 24.0,
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.calculatedEmi,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: AppTheme.secondaryGreen,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    l10n.emiPerMonth(
                                      _calculatedEMI.toStringAsFixed(2),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: AppTheme.secondaryGreen,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 32.0),

                  // Create Loan Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _createLoan,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 2.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_circle_outline, size: 20.0),
                          const SizedBox(width: 8.0),
                          Text(
                            l10n.createLoanTitle,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.searchCustomer,
        hintText: AppLocalizations.of(context)!.searchByNameOrMobile,
        prefixIcon: Icon(Icons.search, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2.0),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      keyboardType: TextInputType.text,
    );
  }

  Widget _buildCustomerDropdown() {
    if (_customers.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.noCustomersFound,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCustomerScreen(),
                ),
              ),
              icon: const Icon(Icons.person_add, color: AppTheme.primaryBlue),
              label: Text(AppLocalizations.of(context)!.addFirstCustomer),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: AppTheme.primaryBlue),
              ),
            ),
          ),
        ],
      );
    }
    return DropdownButtonFormField<String>(
      initialValue: _selectedCustomerId,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.selectCustomer,
        prefixIcon: Icon(Icons.person, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2.0),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      items: _filteredCustomers.map((customer) {
        return DropdownMenuItem<String>(
          value: customer.id,
          child: Text('${customer.name} (${customer.mobile})'),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedCustomerId = value;
        });
      },
      validator: (value) {
        if (value == null) {
          return AppLocalizations.of(context)!.pleaseSelectCustomer;
        }
        return null;
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2.0),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      keyboardType: keyboardType,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildDropdownField({
    required String value,
    required String label,
    required IconData icon,
    required List<DropdownMenuItem<String>> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 2.0),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      items: items,
      onChanged: onChanged,
    );
  }

  void _createLoan() {
    if (_formKey.currentState!.validate() && _selectedCustomerId != null) {
      final loan = Loan(
        id: DateTime.now().toString(),
        customerId: _selectedCustomerId!,
        amount: double.parse(_amountController.text),
        interestRate: double.parse(_interestRateController.text),
        tenure: int.parse(_tenureController.text),
        interestType: _interestType,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(
          Duration(days: int.parse(_tenureController.text) * 30),
        ),
        emi: _calculatedEMI,
      );
      Provider.of<LoanProvider>(context, listen: false).addLoan(loan);

      _showSuccessPopup();

      // Navigate back to dashboard after popup (auto or manual)
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          (mainScreenKey.currentState as MainScreenState).setSelectedIndex(0);
          Navigator.pop(context);
        }
      });
    }
  }

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          contentPadding: const EdgeInsets.all(32),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check_circle, size: 64, color: Colors.white)
                    .animate(
                      onPlay: (controller) => controller.repeat(reverse: false),
                      effects: const [
                        ScaleEffect(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.elasticOut,
                          begin: Offset(0.5, 0.5),
                          end: Offset(1.0, 1.0),
                        ),
                        FadeEffect(
                          duration: Duration(milliseconds: 600),
                          begin: 0.0,
                          end: 1.0,
                        ),
                      ],
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.loanCreatedSuccessfullyTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.loanCreatedSuccessfullyMessage,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OverviewLoansScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, size: 20),
                  label: Text(AppLocalizations.of(context)!.continueToOverview),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _interestRateController.dispose();
    _tenureController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
