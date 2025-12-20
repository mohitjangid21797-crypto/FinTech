import 'package:flutter/material.dart';
import '../models/emi_schedule.dart';
import '../models/customer.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../utils/theme.dart';

class EMIScheduleScreen extends StatefulWidget {
  const EMIScheduleScreen({super.key});

  @override
  EMIScheduleScreenState createState() => EMIScheduleScreenState();
}

class EMIScheduleScreenState extends State<EMIScheduleScreen> {
  List<EMISchedule> _emiSchedules = [];
  List<EMISchedule> _filteredEMISchedules = [];
  final _searchController = TextEditingController();
  String? _selectedCustomerId;
  List<Customer> _customers = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_filterEMISchedules);
  }

  void _loadData() {
    _customers = CustomerService().getCustomers();
    _emiSchedules = LoanService().getEMISchedules();
    _filteredEMISchedules = _emiSchedules;
    setState(() {});
  }

  void _filterEMISchedules() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty && _selectedCustomerId == null) {
      _filteredEMISchedules = _emiSchedules;
    } else {
      _filteredEMISchedules = _emiSchedules.where((emi) {
        final loan = LoanService().getLoanById(emi.loanId);
        if (loan == null) return false;

        bool matchesSearch = true;
        bool matchesCustomer = true;

        if (query.isNotEmpty) {
          final customer =
              CustomerService().getCustomerByMobile(query) ??
              CustomerService().getCustomerById(loan.customerId);
          matchesSearch =
              customer != null &&
              (customer.mobile.toLowerCase().contains(query) ||
                  customer.name.toLowerCase().contains(query));
        }

        if (_selectedCustomerId != null) {
          matchesCustomer = loan.customerId == _selectedCustomerId;
        }

        return matchesSearch && matchesCustomer;
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EMI Schedule'), elevation: 0),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Customer',
                    hintText: 'Search by name or mobile number',
                    prefixIcon: Icon(Icons.search, color: AppTheme.primaryBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppTheme.primaryBlue,
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 12.0),
                DropdownButtonFormField<String>(
                  initialValue: _selectedCustomerId,
                  decoration: InputDecoration(
                    labelText: 'Filter by Customer (Optional)',
                    prefixIcon: Icon(
                      Icons.filter_list,
                      color: AppTheme.primaryBlue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: AppTheme.primaryBlue,
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  items: [
                    const DropdownMenuItem<String>(
                      value: null,
                      child: Text('All Customers'),
                    ),
                    ..._customers.map((customer) {
                      return DropdownMenuItem<String>(
                        value: customer.id,
                        child: Text('${customer.name} (${customer.mobile})'),
                      );
                    }),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCustomerId = value;
                    });
                    _filterEMISchedules();
                  },
                ),
              ],
            ),
          ),

          // EMI List
          Expanded(
            child: _filteredEMISchedules.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _filteredEMISchedules.length,
                    itemBuilder: (context, index) {
                      final emi = _filteredEMISchedules[index];
                      final loan = LoanService().getLoanById(emi.loanId);
                      final customer = loan != null
                          ? CustomerService().getCustomerById(loan.customerId)
                          : null;

                      return Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: emi.isPaid
                                        ? AppTheme.secondaryGreen.withValues(
                                            alpha: 0.1,
                                          )
                                        : Colors.orange.withValues(alpha: 0.1),
                                    child: Icon(
                                      emi.isPaid
                                          ? Icons.check_circle
                                          : Icons.schedule,
                                      color: emi.isPaid
                                          ? AppTheme.secondaryGreen
                                          : Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          customer?.name ?? 'Unknown Customer',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          'Due: ${emi.dueDate.toLocal().toString().split(' ')[0]}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: AppTheme.textSecondary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '₹${emi.amount.toStringAsFixed(2)}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: emi.isPaid
                                                  ? AppTheme.secondaryGreen
                                                  : AppTheme.primaryBlue,
                                            ),
                                      ),
                                      Text(
                                        emi.isPaid ? 'Paid' : 'Pending',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: emi.isPaid
                                                  ? AppTheme.secondaryGreen
                                                  : Colors.orange,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (loan != null) ...[
                                const SizedBox(height: 12.0),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.account_balance,
                                        size: 16.0,
                                        color: AppTheme.primaryBlue,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        'Loan: ₹${loan.amount.toStringAsFixed(2)} • ${loan.tenure} months',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                              color: AppTheme.textSecondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              const SizedBox(height: 12.0),
                              if (!emi.isPaid)
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () => _markAsPaid(emi),
                                    icon: const Icon(Icons.payment, size: 18.0),
                                    label: const Text('Mark as Paid'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.secondaryGreen,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12.0,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule,
            size: 64.0,
            color: AppTheme.textSecondary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16.0),
          Text(
            'No EMI schedules found',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Try adjusting your search or filter criteria',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _markAsPaid(EMISchedule emi) {
    LoanService().markEMIPaid(emi);
    _loadData();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('EMI marked as paid successfully!'),
        backgroundColor: AppTheme.secondaryGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
