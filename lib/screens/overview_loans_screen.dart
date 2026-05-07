import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../models/loan.dart';
import '../providers/loan_provider.dart';
import '../services/customer_service.dart';
import '../services/loan_service.dart';
import '../widgets/loan_card.dart';
import 'all_pdf_screen.dart';

class OverviewLoansScreen extends StatefulWidget {
  const OverviewLoansScreen({super.key});

  @override
  OverviewLoansScreenState createState() => OverviewLoansScreenState();
}

class OverviewLoansScreenState extends State<OverviewLoansScreen> {
  final _searchController = TextEditingController();
  Map<String, int> _loanCounts = {};
  Set<String> _previouslyCompletedLoanIds = {};
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterLoans);
  }

  // Removed _loadLoans() - now reactive via Provider

  void _calculateLoanCounts(List<Loan> allLoans) {
    final query = _searchController.text.toLowerCase();
    final now = DateTime.now();
    final loanService = LoanService(); // Temp singleton for isLoanCompleted
    List<Loan> filteredLoans;

    if (query.isEmpty) {
      filteredLoans = allLoans;
    } else {
      final customer = CustomerService().getCustomerByMobile(query);
      filteredLoans = customer != null
          ? LoanService().getLoansByCustomer(customer.id)
          : <Loan>[];
    }

    _loanCounts = {
      'active': filteredLoans
          .where(
            (loan) =>
                loan.startDate.isBefore(now) &&
                loan.endDate.isAfter(now) &&
                !loanService.isLoanCompleted(loan.id),
          )
          .length,
      'completed': filteredLoans
          .where((loan) => loanService.isLoanCompleted(loan.id))
          .length,
      'pending': filteredLoans
          .where(
            (loan) =>
                loan.startDate.isAfter(now) &&
                !loanService.isLoanCompleted(loan.id),
          )
          .length,
    };
  }

  void _filterLoans() {
    final provider = Provider.of<LoanProvider>(context, listen: false);
    _calculateLoanCounts(provider.loans);
    setState(() {});
  }

  Future<void> _refreshLoans() async {
    final provider = Provider.of<LoanProvider>(context, listen: false);
    provider.loadLoans();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<LoanProvider>(
        builder: (context, loanProvider, child) {
          final now = DateTime.now();
          final loanService = LoanService();
          List<Loan> activeLoans = loanProvider.loans
              .where(
                (loan) =>
                    loan.startDate.isBefore(now) &&
                    loan.endDate.isAfter(now) &&
                    !loanService.isLoanCompleted(loan.id),
              )
              .toList();
          List<Loan> completedLoans = loanProvider.loans
              .where((loan) => loanService.isLoanCompleted(loan.id))
              .toList();
          List<Loan> pendingLoans = loanProvider.loans
              .where(
                (loan) =>
                    loan.startDate.isAfter(now) &&
                    !loanService.isLoanCompleted(loan.id),
              )
              .toList();

          // Filter lists by search
          final query = _searchController.text.toLowerCase();
          if (query.isNotEmpty) {
            final customer = CustomerService().getCustomerByMobile(query);
            if (customer != null) {
              final customerLoans = loanProvider.loans
                  .where((l) => l.customerId == customer.id)
                  .toList();
              activeLoans = activeLoans
                  .where((l) => customerLoans.contains(l))
                  .toList();
              completedLoans = completedLoans
                  .where((l) => customerLoans.contains(l))
                  .toList();
              pendingLoans = pendingLoans
                  .where((l) => customerLoans.contains(l))
                  .toList();
            } else {
              activeLoans = [];
              completedLoans = [];
              pendingLoans = [];
            }
          }

          // Update counts reactively
          _calculateLoanCounts(loanProvider.loans);

          // Check for newly completed (simplified for provider)
          final currentCompletedIds = completedLoans.map((e) => e.id).toSet();
          final newlyCompleted = currentCompletedIds.difference(
            _previouslyCompletedLoanIds,
          );
          if (newlyCompleted.isNotEmpty && mounted) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final firstLoanId = newlyCompleted.first;
              _showCompletionPopup(firstLoanId);
            });
          }
          _previouslyCompletedLoanIds = currentCompletedIds;

          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.overviewLoans),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _refreshLoans,
                ),
              ],
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withValues(alpha: 0.7),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.active),
                  Tab(text: AppLocalizations.of(context)!.completed),
                  Tab(text: AppLocalizations.of(context)!.pending),
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(
                        context,
                      )!.searchByCustomerMobile,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(_isSearching ? Icons.close : Icons.search),
                        onPressed: () {
                          setState(() {
                            _isSearching = !_isSearching;
                            if (!_isSearching) {
                              _searchController.clear();
                            }
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onSubmitted: (_) => setState(() {}),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Active: ${_loanCounts['active']}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Completed: ${_loanCounts['completed']}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Pending: ${_loanCounts['pending']}',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildLoanList(activeLoans, 'No active loans'),
                      _buildLoanList(completedLoans, 'No completed loans'),
                      _buildLoanList(pendingLoans, 'No pending loans'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoanList(List<Loan> loans, String emptyMessage) {
    if (loans.isEmpty) {
      return RefreshIndicator(
        onRefresh: _refreshLoans,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Center(child: Text(emptyMessage)),
          ),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () => _refreshLoans(),
      child: ListView.builder(
        itemCount: loans.length,
        itemBuilder: (context, index) {
          return LoanCard(loan: loans[index]);
        },
      ),
    );
  }

  void _showCompletionPopup(String loanId) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animated title with confetti effect
                Animate(
                  effects: [
                    const ScaleEffect(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.elasticOut,
                      begin: Offset(0.5, 0.5),
                    ),
                    const ShakeEffect(duration: Duration(milliseconds: 1000)),
                    const FadeEffect(duration: Duration(milliseconds: 500)),
                  ],
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.celebration,
                      color: Colors.green,
                      size: 40,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Main message
                Animate(
                  effects: [
                    const FadeEffect(duration: Duration(milliseconds: 600)),
                    SlideEffect(
                      duration: const Duration(milliseconds: 600),
                      begin: const Offset(0, 0.2),
                    ),
                  ],
                  child: Text(
                    AppLocalizations.of(context)!.congratulations,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                Animate(
                  delay: const Duration(milliseconds: 200),
                  effects: [
                    const FadeEffect(duration: Duration(milliseconds: 600)),
                    SlideEffect(
                      duration: const Duration(milliseconds: 600),
                      begin: const Offset(0, 0.2),
                    ),
                  ],
                  child: Text(
                    AppLocalizations.of(context)!.allEMIsPaidSuccessfully,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 24),

                // Question
                Text(
                  AppLocalizations.of(context)!.moveToPDFDocuments,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ).animate(delay: 400.ms).fadeIn(duration: 600.ms),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // No button
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.later,
                        style: TextStyle(color: Colors.white),
                      ),
                    ).animate(delay: 600.ms).fadeIn(),

                    // Yes button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllPDFScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green.shade600,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.viewPDF,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ).animate(delay: 600.ms).fadeIn().scale(duration: 200.ms),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
