import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../models/emi_schedule.dart';
import '../models/customer.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../utils/theme.dart';
import '../l10n/app_localizations.dart';

class LoanEMIScreen extends StatefulWidget {
  final Loan loan;

  const LoanEMIScreen({super.key, required this.loan});

  @override
  LoanEMIScreenState createState() => LoanEMIScreenState();
}

class LoanEMIScreenState extends State<LoanEMIScreen> {
  late List<EMISchedule> _emiSchedules;
  late Customer? _customer;
  int _pendingCount = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    _emiSchedules = LoanService().getEMISchedulesByLoan(widget.loan.id);
    _customer = CustomerService().getCustomerById(widget.loan.customerId);
    _pendingCount = _emiSchedules.where((emi) => !emi.isPaid).length;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = LoanService().isLoanCompleted(widget.loan.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.loanEMIDetails),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Loan Summary Card
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.primaryBlue.withValues(
                        alpha: 0.1,
                      ),
                      child: Icon(
                        Icons.account_balance,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _customer?.name ?? AppLocalizations.of(context)!.unknownCustomer,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Loan ID: ${widget.loan.id.substring(0, 8)}...',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppTheme.textSecondary),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? Colors.blue.withValues(alpha: 0.1)
                            : AppTheme.secondaryGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        isCompleted
                            ? AppLocalizations.of(context)!.completed
                            : AppLocalizations.of(context)!.active,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isCompleted
                              ? Colors.blue
                              : AppTheme.secondaryGreen,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryItem(
                        AppLocalizations.of(context)!.principal,
                        '₹${widget.loan.amount.toStringAsFixed(2)}',
                        Icons.attach_money,
                      ),
                    ),
                    Expanded(
                      child: _buildSummaryItem(
                        AppLocalizations.of(context)!.emiLabel,
                        '₹${widget.loan.emi.toStringAsFixed(2)}',
                        Icons.payment,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryItem(
                        AppLocalizations.of(context)!.rate,
                        '${widget.loan.interestRate}%',
                        Icons.percent,
                      ),
                    ),
                    Expanded(
                      child: _buildSummaryItem(
                        AppLocalizations.of(context)!.tenure,
                        '${widget.loan.tenure} months',
                        Icons.calendar_today,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        size: 16.0,
                        color: AppTheme.primaryBlue,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${widget.loan.startDate.toLocal().toString().split(' ')[0]} - ${widget.loan.endDate.toLocal().toString().split(' ')[0]}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // EMI Schedule
          Expanded(
            child: _emiSchedules.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: _emiSchedules.length,
                    itemBuilder: (context, index) {
                      final emi = _emiSchedules[index];
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
                                          'EMI ${index + 1}',
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
                                        emi.isPaid
                                            ? AppLocalizations.of(context)!.paid
                                            : AppLocalizations.of(
                                                context,
                                              )!.pending,
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
                              const SizedBox(height: 12.0),
                              if (!emi.isPaid)
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () => _payEMI(emi),
                                    icon: const Icon(Icons.payment, size: 18.0),
                                    label: Text(
                                      AppLocalizations.of(context)!.markAsPaid,
                                    ),
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
          if (_pendingCount > 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _markAllEMIsPaid,
                  icon: const Icon(Icons.payments_outlined, size: 20),
                  label: Text(
                    AppLocalizations.of(
                      context,
                    )!.markAllPendingEMIsAsPaid(_pendingCount),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _markAllEMIsPaid() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.markAllEMIsPaid),
        content: Text(
          AppLocalizations.of(context)!.markAllEMIsPaidConfirm(_pendingCount),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child:  Text(AppLocalizations.of(context)!.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(AppLocalizations.of(context)!.confirm),
          ),
        ],
      ),
    );

    if (confirm != true || !mounted) return;

    try {
      final pendingEmis = _emiSchedules.where((emi) => !emi.isPaid).toList();
      for (final emi in pendingEmis) {
        await LoanService().markEMIPaid(emi);
      }
      _loadData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)!.allEMIsMarkedAsPaid(_pendingCount),
            ),
            backgroundColor: AppTheme.secondaryGreen,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20.0, color: AppTheme.primaryBlue),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
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
            'EMI schedule will be generated when loan is created',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _payEMI(EMISchedule emi) async {
    try {
      await LoanService().markEMIPaid(
        emi,
      ); // Now auto-generates PDF if completed
      _loadData();

      // Check if loan is completed
      if (LoanService().isLoanCompleted(widget.loan.id)) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Loan completed successfully! PDF has been auto-generated and is available in PDF Documents.',
            ),
            backgroundColor: AppTheme.secondaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('EMI marked as paid successfully!'),
            backgroundColor: AppTheme.secondaryGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    }
  }
}
