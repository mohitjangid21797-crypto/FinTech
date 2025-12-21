import 'package:flutter/material.dart';
import '../models/ledger_entry.dart';
import '../models/customer.dart';
import '../services/ledger_service.dart';
import '../services/customer_service.dart';
import '../utils/theme.dart';
import '../screens/create_loan_screen.dart';

class EMILedgerScreen extends StatefulWidget {
  const EMILedgerScreen({super.key});

  @override
  EMILedgerScreenState createState() => EMILedgerScreenState();
}

class EMILedgerScreenState extends State<EMILedgerScreen>
    with TickerProviderStateMixin {
  List<Customer> _customers = [];
  List<Customer> _filteredCustomers = [];
  final Map<String, List<LedgerEntry>> _customerLedgers = {};
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  late AnimationController _fabAnimationController;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fabAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fabAnimationController, curve: Curves.easeInOut),
    );
    _fabAnimationController.forward();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _loadData() {
    _customers = CustomerService().getCustomers();
    _customerLedgers.clear();

    // Generate ledgers for all customers
    final ledgerService = LedgerService();
    for (final customer in _customers) {
      _customerLedgers[customer.id] = ledgerService.getCustomerLedger(
        customer.id,
      );
    }

    _applyFilters();
  }

  void _applyFilters() {
    if (_isSearching && _searchController.text.isNotEmpty) {
      final query = _searchController.text.toLowerCase();
      _filteredCustomers = _customers.where((customer) {
        return customer.name.toLowerCase().contains(query) ||
            customer.mobile.contains(query);
      }).toList();
    } else {
      _filteredCustomers = List.from(_customers);
    }

    // Sort by outstanding balance (highest first)
    _filteredCustomers.sort((a, b) {
      final aBalance = _customerLedgers[a.id]?.last.balance ?? 0.0;
      final bBalance = _customerLedgers[b.id]?.last.balance ?? 0.0;
      return bBalance.compareTo(aBalance);
    });

    setState(() {});
  }

  Map<String, double> _calculateSummary() {
    double totalOutstanding = 0.0;
    double totalCollected = 0.0;
    int customersWithBalance = 0;

    for (final customer in _filteredCustomers) {
      final ledger = _customerLedgers[customer.id];
      if (ledger != null && ledger.isNotEmpty) {
        final balance = ledger.last.balance;
        if (balance > 0) {
          totalOutstanding += balance;
          customersWithBalance++;
        }
        // Calculate total collected (debits)
        for (final entry in ledger) {
          totalCollected += entry.debit;
        }
      }
    }

    return {
      'totalOutstanding': totalOutstanding,
      'totalCollected': totalCollected,
      'customersWithBalance': customersWithBalance.toDouble(),
      'totalCustomers': _filteredCustomers.length.toDouble(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final summary = _calculateSummary();

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search by customer name or mobile...',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                onChanged: (value) => _applyFilters(),
              )
            : const Text('Customer Ledger'),
        elevation: 0,
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                  _applyFilters();
                }
              });
            },
          ),
        ],
        bottom: _isSearching
            ? PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(color: theme.dividerColor, height: 1.0),
              )
            : null,
      ),
      body: Column(
        children: [
          // Summary Cards
          if (_filteredCustomers.isNotEmpty) _buildSummaryCards(summary),

          // Main Content
          Expanded(
            child: _filteredCustomers.isEmpty
                ? _buildEmptyState()
                : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      _loadData();
                    },
                    color: AppTheme.primaryBlue,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: _filteredCustomers.length,
                      itemBuilder: (context, index) {
                        final customer = _filteredCustomers[index];
                        final ledger = _customerLedgers[customer.id] ?? [];
                        return AnimatedOpacity(
                          opacity: 1.0,
                          duration: Duration(milliseconds: 300 + (index * 50)),
                          curve: Curves.easeInOut,
                          child: SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: const Offset(0.0, 0.1),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent:
                                        ModalRoute.of(context)?.animation ??
                                        _fabAnimationController,
                                    curve: Interval(
                                      0.0,
                                      1.0,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                ),
                            child: _buildCustomerLedgerSection(
                              customer,
                              ledger,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabAnimation,
        child: FloatingActionButton.extended(
          onPressed: () {
            // Navigate to create loan screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateLoanScreen()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('Create Loan'),
          backgroundColor: AppTheme.primaryBlue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSummaryCards(Map<String, double> summary) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.surfaceGrey,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildSummaryCard(
              'Outstanding',
              '₹${summary['totalOutstanding']!.toStringAsFixed(0)}',
              '${summary['customersWithBalance']!.toInt()} customers',
              Colors.orange,
              Icons.account_balance_wallet,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: _buildSummaryCard(
              'Collected',
              '₹${summary['totalCollected']!.toStringAsFixed(0)}',
              '${summary['totalCustomers']!.toInt()} total customers',
              AppTheme.secondaryGreen,
              Icons.check_circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String amount,
    String count,
    Color color,
    IconData icon,
  ) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20.0),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              amount,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              count,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerLedgerSection(
    Customer customer,
    List<LedgerEntry> ledger,
  ) {
    final theme = Theme.of(context);
    final outstandingBalance = ledger.isNotEmpty ? ledger.last.balance : 0.0;
    final totalCredit = ledger.fold<double>(
      0,
      (sum, entry) => sum + entry.credit,
    );
    final totalDebit = ledger.fold<double>(
      0,
      (sum, entry) => sum + entry.debit,
    );

    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          _showCustomerLedgerDetails(customer, ledger);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customer Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          customer.name,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          customer.mobile,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${outstandingBalance.toStringAsFixed(0)}',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: outstandingBalance > 0
                              ? Colors.orange
                              : outstandingBalance < 0
                              ? AppTheme.secondaryGreen
                              : theme.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        outstandingBalance > 0
                            ? 'You will get'
                            : outstandingBalance < 0
                            ? 'You will give'
                            : 'Settled',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Transaction Summary
              Row(
                children: [
                  Expanded(
                    child: _buildTransactionSummary(
                      'Given',
                      totalCredit,
                      AppTheme.primaryBlue,
                      Icons.arrow_upward,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildTransactionSummary(
                      'Received',
                      totalDebit,
                      AppTheme.secondaryGreen,
                      Icons.arrow_downward,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Recent Transactions Preview
              if (ledger.isNotEmpty) ...[
                Text(
                  'Recent Transactions',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8.0),
                ...ledger
                    .take(3)
                    .map((entry) => _buildLedgerEntryPreview(entry)),
                if (ledger.length > 3)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '+${ledger.length - 3} more transactions',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionSummary(
    String label,
    double amount,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16.0),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹${amount.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLedgerEntryPreview(LedgerEntry entry) {
    final theme = Theme.of(context);
    final isCredit = entry.credit > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  _formatDate(entry.date),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isCredit ? '+' : '-'}₹${(isCredit ? entry.credit : entry.debit).toStringAsFixed(0)}',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: isCredit ? AppTheme.primaryBlue : AppTheme.secondaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomerLedgerDetails(Customer customer, List<LedgerEntry> ledger) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        maxChildSize: 0.9,
        builder: (context, scrollController) =>
            _buildLedgerDetailsSheet(customer, ledger, scrollController),
      ),
    );
  }

  Widget _buildLedgerDetailsSheet(
    Customer customer,
    List<LedgerEntry> ledger,
    ScrollController scrollController,
  ) {
    final theme = Theme.of(context);
    final outstandingBalance = ledger.isNotEmpty ? ledger.last.balance : 0.0;

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customer.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      customer.mobile,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹${outstandingBalance.abs().toStringAsFixed(0)}',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: outstandingBalance > 0
                          ? Colors.orange
                          : outstandingBalance < 0
                          ? AppTheme.secondaryGreen
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    outstandingBalance > 0
                        ? 'You will get'
                        : outstandingBalance < 0
                        ? 'You will give'
                        : 'Settled',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20.0),

          // Transaction List
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: ledger.length,
              itemBuilder: (context, index) {
                final entry = ledger[index];
                return _buildDetailedLedgerEntry(entry);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedLedgerEntry(LedgerEntry entry) {
    final theme = Theme.of(context);
    final isCredit = entry.credit > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.1),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  entry.description,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Text(
                '${isCredit ? '+' : '-'}₹${(isCredit ? entry.credit : entry.debit).toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isCredit
                      ? AppTheme.primaryBlue
                      : AppTheme.secondaryGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                _formatDate(entry.date),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
              const Spacer(),
              Text(
                'Balance: ₹${entry.balance.toStringAsFixed(2)}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: entry.balance > 0
                      ? Colors.orange
                      : entry.balance < 0
                      ? AppTheme.secondaryGreen
                      : theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly.isAtSameMomentAs(today)) {
      return 'Today';
    } else if (dateOnly.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else if (dateOnly.isAtSameMomentAs(tomorrow)) {
      return 'Tomorrow';
    } else {
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    }
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.account_balance_wallet,
                size: 64.0,
                color: AppTheme.primaryBlue,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'No Customers Yet',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Start by creating loans to see your customer ledger. Track transactions and manage your business efficiently.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateLoanScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Create Your First Loan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
