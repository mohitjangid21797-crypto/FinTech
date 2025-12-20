import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../utils/theme.dart';
import 'add_customer_screen.dart';
import 'create_loan_screen.dart';
import 'emi_ledger_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to 2130 GROUP',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Clarity and Control for Every Rupee',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  duration: 600.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 24.0),

            // Key Metrics
            Text(
                  'Key Metrics',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                )
                .animate()
                .fadeIn(delay: 200.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 200.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Total Loans',
                        LoanService().getLoans().length.toString(),
                        Icons.account_balance,
                        AppTheme.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Active Loans',
                        _getActiveLoansCount().toString(),
                        Icons.trending_up,
                        AppTheme.secondaryGreen,
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(delay: 400.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 400.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Total Customers',
                        CustomerService().getCustomers().length.toString(),
                        Icons.people,
                        AppTheme.accentGreen,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Pending EMIs',
                        _getPendingEMIsCount().toString(),
                        Icons.schedule,
                        Colors.orange,
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(delay: 500.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 500.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            Row(
                  children: [
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Total Loan Amount',
                        '₹${LoanService().getTotalLoanAmount().toStringAsFixed(2)}',
                        Icons.account_balance_wallet,
                        AppTheme.primaryBlue,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildMetricCard(
                        context,
                        'Total Profit',
                        '₹${LoanService().getTotalProfit().toStringAsFixed(2)}',
                        Icons.trending_up,
                        AppTheme.secondaryGreen,
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(delay: 600.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 600.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 24.0),

            // Quick Actions
            Text(
                  'Quick Actions',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                )
                .animate()
                .fadeIn(delay: 700.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 700.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Add Customer',
                        Icons.person_add,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCustomerScreen(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'Create Loan',
                        Icons.add_circle,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateLoanScreen(),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                .animate()
                .fadeIn(delay: 800.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 800.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            Row(
                  children: [
                    Expanded(
                      child: _buildActionButton(
                        context,
                        'EMI Ledger',
                        Icons.book,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EMILedgerScreen(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Container(), // Placeholder for future button
                    ),
                  ],
                )
                .animate()
                .fadeIn(delay: 900.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 900.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 24.0),

            // Recent Activity
            Text(
                  'Recent Activity',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                )
                .animate()
                .fadeIn(delay: 1000.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 1000.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
            const SizedBox(height: 16.0),
            _buildRecentActivity(context)
                .animate()
                .fadeIn(delay: 1100.ms, duration: 500.ms)
                .slideY(
                  begin: 0.2,
                  end: 0.0,
                  delay: 1100.ms,
                  duration: 500.ms,
                  curve: Curves.easeOut,
                ),
          ],
        ),
      ),
    );
  }

  int _getActiveLoansCount() {
    final now = DateTime.now();
    return LoanService()
        .getLoans()
        .where(
          (loan) => loan.startDate.isBefore(now) && loan.endDate.isAfter(now),
        )
        .length;
  }

  int _getPendingEMIsCount() {
    return LoanService()
        .getEMISchedules()
        .where((emi) => !emi.isPaid && emi.dueDate.isBefore(DateTime.now()))
        .length;
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32.0, color: color),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 24.0),
          const SizedBox(height: 8.0),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    final recentLoans = LoanService().getLoans().take(3).toList();

    if (recentLoans.isEmpty) {
      return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('No recent activity'),
        ),
      );
    }

    return Column(
      children: recentLoans.map((loan) {
        final customer = CustomerService().getCustomerById(loan.customerId);
        return Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppTheme.primaryBlue.withValues(alpha: 0.1),
              child: Icon(Icons.account_balance, color: AppTheme.primaryBlue),
            ),
            title: Text('Loan created for ${customer?.name ?? 'Unknown'}'),
            subtitle: Text(
              'Amount: ₹${loan.amount.toStringAsFixed(2)} • ${loan.startDate.toLocal().toString().split(' ')[0]}',
            ),
            trailing: Text(
              '₹${loan.emi.toStringAsFixed(2)}/month',
              style: TextStyle(
                color: AppTheme.secondaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
