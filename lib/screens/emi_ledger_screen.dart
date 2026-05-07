import 'package:flutter/material.dart';
import 'package:loan_management_app/l10n/app_localizations.dart';
import '../models/ledger_entry.dart';
import '../models/customer.dart';
import '../services/ledger_service.dart';
import '../services/customer_service.dart';
import 'dart:ui';
import '../utils/theme.dart';
import '../screens/create_loan_screen.dart';
import '../widgets/voice_search_overlay.dart';

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
  bool _isSearchVisible = false;
  late AnimationController _searchFocusController;
  late AnimationController _searchVisibilityController;
  late Animation<double> _searchScaleAnimation;
  late Animation<double> _searchGlowAnimation;
  late Animation<Offset> _searchSlideAnimation;
  late AnimationController _fabAnimationController;
  late Animation<double> _fabAnimation;

  @override
  void initState() {
    super.initState();
    _searchFocusController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _searchScaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _searchFocusController,
        curve: Curves.easeOutBack,
      ),
    );
    _searchGlowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _searchFocusController, curve: Curves.easeInOut),
    );
    _searchVisibilityController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _searchSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _searchVisibilityController,
            curve: Curves.easeInOut,
          ),
        );
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
    _searchFocusController.dispose();
    _searchVisibilityController.dispose();
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
    if (_isSearchVisible && _searchController.text.isNotEmpty) {
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
      final aLedger = _customerLedgers[a.id];
      final aBalance = aLedger?.isNotEmpty == true
          ? aLedger!.last.balance
          : 0.0;
      final bLedger = _customerLedgers[b.id];
      final bBalance = bLedger?.isNotEmpty == true
          ? bLedger!.last.balance
          : 0.0;
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

  Widget _buildLedgerSearchBar(
    BuildContext context,
    ThemeData theme,
    AppLocalizations localizations,
  ) {
    return AnimatedBuilder(
      animation: _searchFocusController,
      builder: (context, child) {
        return SlideTransition(
          position: _searchSlideAnimation,
          child: Transform.scale(
            scale: _searchScaleAnimation.value,
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withValues(
                      alpha: 0.3 * _searchGlowAnimation.value,
                    ),
                    blurRadius: 20 + 10 * _searchGlowAnimation.value,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10 * _searchGlowAnimation.value,
                    sigmaY: 10 * _searchGlowAnimation.value,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withValues(alpha: 0.9),
                          Colors.white.withValues(alpha: 0.7),
                          AppTheme.primaryBlue.withValues(alpha: 0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(
                        color: AppTheme.primaryBlue.withValues(
                          alpha: 0.2 + 0.3 * _searchGlowAnimation.value,
                        ),
                        width: 1.5,
                      ),
                    ),
                    child: SearchBar(
                      controller: _searchController,
                      hintText: localizations.searchByCustomerNameOrMobile,
                      hintStyle: WidgetStatePropertyAll(
                        theme.textTheme.bodyLarge?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                          fontSize: 16,
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search,
                          color: AppTheme.primaryBlue.withValues(alpha: 0.8),
                        ),
                      ),
                      trailing: [
                        if (_searchController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear, size: 20),
                            onPressed: () {
                              _searchController.clear();
                              _applyFilters();
                            },
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.mic,
                              color: AppTheme.primaryBlue.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => VoiceSearchOverlay(
                                  onSearch: (mobile) {
                                    _searchController.text = mobile;
                                    _applyFilters();
                                  },
                                  onDismiss: () => Navigator.of(context).pop(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                      elevation: WidgetStatePropertyAll(0),
                      shadowColor: WidgetStatePropertyAll(Colors.transparent),
                      surfaceTintColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                      textStyle: WidgetStatePropertyAll(
                        theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
                      ),
                      overlayColor: WidgetStatePropertyAll(
                        AppTheme.primaryBlue.withValues(alpha: 0.1),
                      ),
                      onTap: () {
                        _searchFocusController.forward();
                      },
                      onSubmitted: (value) {
                        _searchFocusController.reverse();
                      },
                      onChanged: (value) {
                        _applyFilters();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final summary = _calculateSummary();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.customerLedger,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: theme.brightness == Brightness.dark
            ? Colors.black
            : AppTheme.primaryBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          AnimatedBuilder(
            animation: Listenable.merge([
              _searchFocusController,
              _searchVisibilityController,
            ]),
            builder: (context, child) {
              return IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryBlue.withValues(alpha: 0.1),
                        AppTheme.primaryBlue.withValues(alpha: 0.05),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryBlue.withValues(
                          alpha: 0.3 * _searchGlowAnimation.value,
                        ),
                        blurRadius: 16,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isSearchVisible ? Icons.close : Icons.search,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                tooltip: _isSearchVisible ? 'Hide search' : 'Search customers',
                onPressed: () {
                  setState(() {
                    _isSearchVisible = !_isSearchVisible;
                  });
                  if (_isSearchVisible) {
                    _searchVisibilityController.forward();
                    Future.delayed(const Duration(milliseconds: 300), () {
                      if (mounted) {
                        // ignore: use_build_context_synchronously
                        FocusScope.of(context).requestFocus(FocusNode());
                      }
                    });
                  } else {
                    _searchVisibilityController.reverse();
                    _searchController.clear();
                    FocusScope.of(context).unfocus();
                    _applyFilters();
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isSearchVisible
                ? _buildLedgerSearchBar(context, theme, localizations)
                : const SizedBox.shrink(),
          ),
          // Summary Cards
          if (_filteredCustomers.isNotEmpty) _buildSummaryCards(summary),

          // Main Content
          Expanded(
            child: _filteredCustomers.isEmpty && !_isSearchVisible
                ? _buildEmptyState()
                : _filteredCustomers.isEmpty && _isSearchVisible
                ? _buildNoSearchResults(context, theme, localizations)
                : RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      _loadData();
                    },
                    color: AppTheme.primaryBlue,
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: 20.0,
                        top: _isSearchVisible ? 0 : 16,
                      ),
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
                                    curve: const Interval(
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
          label: Text(localizations.createLoan),
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
              AppLocalizations.of(context)!.ledgerOutstanding,
              '₹${summary['totalOutstanding']!.toStringAsFixed(0)}',
              '${summary['customersWithBalance']!.toInt()} ${AppLocalizations.of(context)!.customers}',
              Colors.orange,
              Icons.account_balance_wallet,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: _buildSummaryCard(
              AppLocalizations.of(context)!.ledgerCollected,
              '₹${summary['totalCollected']!.toStringAsFixed(0)}',
              '${summary['totalCustomers']!.toInt()} ${AppLocalizations.of(context)!.totalCustomers.toLowerCase()}',
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
                            ? AppLocalizations.of(context)!.ledgerStatusReceive
                            : outstandingBalance < 0
                            ? AppLocalizations.of(context)!.ledgerStatusPay
                            : AppLocalizations.of(context)!.ledgerStatusSettled,
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
                      AppLocalizations.of(context)!.givenAmount,
                      totalCredit,
                      AppTheme.primaryBlue,
                      Icons.arrow_upward,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildTransactionSummary(
                      AppLocalizations.of(context)!.receivedAmount,
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
                  AppLocalizations.of(context)!.recentTransactions,
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
                        ? AppLocalizations.of(context)!.ledgerStatusReceive
                        : outstandingBalance < 0
                        ? AppLocalizations.of(context)!.ledgerStatusPay
                        : AppLocalizations.of(context)!.ledgerStatusSettled,
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

  Widget _buildNoSearchResults(
    BuildContext context,
    ThemeData theme,
    AppLocalizations localizations,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off,
                size: 64.0,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              localizations.noResultsFound,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              localizations.tryAdjustingSearchTerms,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

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
              localizations.noCustomersLedger,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              localizations.ledgerEmptyMessage,
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
              label: Text(localizations.createFirstLoanLedger),
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
