import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../services/customer_service.dart';
import '../services/loan_service.dart';
import '../utils/theme.dart';
import '../screens/loan_emi_screen.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;

  const LoanCard({super.key, required this.loan});

  @override
  Widget build(BuildContext context) {
    final customer = CustomerService().getCustomerById(loan.customerId);
    final isActive =
        loan.startDate.isBefore(DateTime.now()) &&
        loan.endDate.isAfter(DateTime.now());
    final isCompleted = LoanService().isLoanCompleted(loan.id);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoanEMIScreen(loan: loan)),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: isActive
                        ? AppTheme.secondaryGreen.withValues(alpha: 0.1)
                        : AppTheme.primaryBlue.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.account_balance,
                      color: isActive
                          ? AppTheme.secondaryGreen
                          : AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${customer?.name ?? 'Unknown Customer'} (${customer?.mobile ?? 'N/A'})',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Loan ID: ${loan.id.substring(0, 8)}...',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: isCompleted
                          ? Colors.blue.withValues(alpha: 0.1)
                          : isActive
                          ? AppTheme.secondaryGreen.withValues(alpha: 0.1)
                          : Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      isCompleted
                          ? 'Completed'
                          : isActive
                          ? 'Active'
                          : 'Inactive',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isCompleted
                            ? Colors.blue
                            : isActive
                            ? AppTheme.secondaryGreen
                            : Colors.orange,
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
                    child: _buildInfoItem(
                      context,
                      'Amount',
                      '₹${loan.amount.toStringAsFixed(2)}',
                      Icons.attach_money,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      context,
                      'EMI',
                      '₹${loan.emi.toStringAsFixed(2)}',
                      Icons.payment,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoItem(
                      context,
                      'Rate',
                      '${loan.interestRate}%',
                      Icons.percent,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoItem(
                      context,
                      'Tenure',
                      '${loan.tenure} months',
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
                      '${loan.startDate.toLocal().toString().split(' ')[0]} - ${loan.endDate.toLocal().toString().split(' ')[0]}',
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
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
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
}
