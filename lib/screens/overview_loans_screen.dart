import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../widgets/loan_card.dart';

class OverviewLoansScreen extends StatefulWidget {
  const OverviewLoansScreen({super.key});

  @override
  OverviewLoansScreenState createState() => OverviewLoansScreenState();
}

class OverviewLoansScreenState extends State<OverviewLoansScreen> {
  List<Loan> _activeLoans = [];
  List<Loan> _completedLoans = [];
  List<Loan> _pendingLoans = [];
  final _searchController = TextEditingController();
  Map<String, int> _loanCounts = {};

  @override
  void initState() {
    super.initState();
    _loadLoans();
    _searchController.addListener(_filterLoans);
  }

  void _loadLoans() {
    final allLoans = LoanService().getLoans();
    final loanService = LoanService();
    final now = DateTime.now();

    _activeLoans = allLoans
        .where(
          (loan) =>
              loan.startDate.isBefore(now) &&
              loan.endDate.isAfter(now) &&
              !loanService.isLoanCompleted(loan.id),
        )
        .toList();
    _completedLoans = allLoans
        .where((loan) => loanService.isLoanCompleted(loan.id))
        .toList();
    _pendingLoans = allLoans
        .where(
          (loan) =>
              loan.startDate.isAfter(now) &&
              !loanService.isLoanCompleted(loan.id),
        )
        .toList();

    _calculateLoanCounts();
    setState(() {});
  }

  void _calculateLoanCounts() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      _loanCounts = {
        'active': _activeLoans.length,
        'completed': _completedLoans.length,
        'pending': _pendingLoans.length,
      };
    } else {
      final customer = CustomerService().getCustomerByMobile(query);
      if (customer != null) {
        final customerLoans = LoanService().getLoansByCustomer(customer.id);
        final loanService = LoanService();
        final now = DateTime.now();
        _loanCounts = {
          'active': customerLoans
              .where(
                (loan) =>
                    loan.startDate.isBefore(now) &&
                    loan.endDate.isAfter(now) &&
                    !loanService.isLoanCompleted(loan.id),
              )
              .length,
          'completed': customerLoans
              .where((loan) => loanService.isLoanCompleted(loan.id))
              .length,
          'pending': customerLoans
              .where(
                (loan) =>
                    loan.startDate.isAfter(now) &&
                    !loanService.isLoanCompleted(loan.id),
              )
              .length,
        };
      } else {
        _loanCounts = {'active': 0, 'completed': 0, 'pending': 0};
      }
    }
  }

  void _filterLoans() {
    _calculateLoanCounts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Overview Loans'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withValues(alpha: 0.7),
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by Customer Mobile Number',
                  prefixIcon: Icon(Icons.search),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Active: ${_loanCounts['active']}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Completed: ${_loanCounts['completed']}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Pending: ${_loanCounts['pending']}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildLoanList(_activeLoans, 'No active loans'),
                  _buildLoanList(_completedLoans, 'No completed loans'),
                  _buildLoanList(_pendingLoans, 'No pending loans'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanList(List<Loan> loans, String emptyMessage) {
    if (loans.isEmpty) {
      return Center(child: Text(emptyMessage));
    }
    return ListView.builder(
      itemCount: loans.length,
      itemBuilder: (context, index) {
        return LoanCard(loan: loans[index]);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
