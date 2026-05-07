import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/customer.dart';
import '../providers/customer_provider.dart';
import '../utils/theme.dart';
import 'create_loan_screen.dart';

class AddCustomerScreen extends StatefulWidget {
  final Customer? customer;

  const AddCustomerScreen({super.key, this.customer});

  @override
  AddCustomerScreenState createState() => AddCustomerScreenState();
}

class AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  bool _smsConsent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addCustomerTitle),
        leading: Icon(Icons.person_add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.customerDetails,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppTheme.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.mobile,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterMobileNumber;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterEmail;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.location,
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterLocation;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.surfaceGrey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        AppLocalizations.of(context)!.smsConsent,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      value: _smsConsent,
                      activeColor: AppTheme.secondaryGreen,
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        setState(() {
                          _smsConsent = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: AnimatedScale(
                      scale: 1.0,
                      duration: const Duration(milliseconds: 150),
                      child: ElevatedButton.icon(
                        onPressed: _addCustomer,
                        icon: const Icon(Icons.add),
                        label: Text(AppLocalizations.of(context)!.addCustomer),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 16.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
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
  }

  void _addCustomer() {
    if (_formKey.currentState!.validate()) {
      final customer = Customer(
        id: DateTime.now().toString(),
        name: _nameController.text,
        mobile: _mobileController.text,
        email: _emailController.text,
        location: _locationController.text,
        smsConsent: _smsConsent,
      );
      Provider.of<CustomerProvider>(
        context,
        listen: false,
      ).addCustomer(customer);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.person_add, color: AppTheme.secondaryGreen, size: 32),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.customerAdded,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: AppTheme.secondaryGreen,
                size: 64,
              ),
              const SizedBox(height: 16),
               Text(
                AppLocalizations.of(context)!.customerAddedSuccessfully,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate to create loan screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateLoanScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: Text(AppLocalizations.of(context)!.continueText),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primaryBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(AppLocalizations.of(context)!.pleaseFillAllRequiredFields)),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
