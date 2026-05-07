import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/customer_provider.dart';
import '../utils/localized_text_helper.dart';
import '../utils/theme.dart';
import '../widgets/customer_card.dart';
import 'add_customer_screen.dart';
import 'dart:ui';
import 'edit_customer_details.dart';
import '../widgets/voice_search_overlay.dart';

class AllCustomersScreen extends StatefulWidget {
  const AllCustomersScreen({super.key});

  @override
  State<AllCustomersScreen> createState() => _AllCustomersScreenState();
}

class _AllCustomersScreenState extends State<AllCustomersScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchVisible = false;
  late AnimationController _searchFocusController;
  late AnimationController _searchVisibilityController;
  late Animation<double> _searchScaleAnimation;
  late Animation<double> _searchGlowAnimation;
  late Animation<Offset> _searchSlideAnimation;

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
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusController.dispose();
    _searchVisibilityController.dispose();
    super.dispose();
  }

  Widget _buildSearchBar(
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
                      hintText: localizations.searchCustomers,
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
                              setState(() {});
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
                                    setState(() {});
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
                        setState(() {});
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.allCustomers,
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
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<CustomerProvider>(
        builder: (context, customerProvider, child) {
          final allCustomers = customerProvider.customers;
          final filteredCustomers = _searchController.text.isNotEmpty
              ? allCustomers.where((customer) {
                  final query = _searchController.text.toLowerCase();
                  return customer.name.toLowerCase().contains(query) ||
                      customer.mobile.toLowerCase().contains(query) ||
                      customer.email.toLowerCase().contains(query) ||
                      customer.location.toLowerCase().contains(query);
                }).toList()
              : allCustomers;

          if (allCustomers.isEmpty) {
            return _buildEmptyState(context, theme, localizations);
          }

          if (filteredCustomers.isEmpty && _searchController.text.isNotEmpty) {
            return _buildNoSearchResults(context, theme, localizations);
          }

          return Column(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _isSearchVisible
                    ? _buildSearchBar(context, theme, localizations)
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {});
                  },
                  color: AppTheme.primaryBlue,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      bottom: 20.0,
                      top: _isSearchVisible ? 0 : 0,
                    ),
                    itemCount: filteredCustomers.length,
                    itemBuilder: (context, index) {
                      final customer = filteredCustomers[index];
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
                                      AlwaysStoppedAnimation(0.0),
                                  curve: Interval(
                                    0.0,
                                    1.0,
                                    curve: Curves.easeOut,
                                  ),
                                ),
                              ),
                          child: CustomerCard(
                            customer: customer,
                            onEdit: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditCustomerDetailsScreen(
                                        customer: customer,
                                      ),
                                ),
                              );
                            },
                            onDelete: () {
                              _showDeleteConfirmationDialog(
                                context,
                                customer,
                                customerProvider,
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(
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
                color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.people_outline,
                size: 64.0,
                color: AppTheme.primaryBlue,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              localizations.noCustomersYet,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              localizations.startBuildingCustomerDatabase,
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
                    builder: (context) => const AddCustomerScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: Text(localizations.addYourFirstCustomer),
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

  void _showDeleteConfirmationDialog(
    BuildContext context,
    customer,
    CustomerProvider customerProvider,
  ) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final customerName = localizedText(context, customer.name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Row(
            children: [
              Icon(Icons.warning, color: theme.colorScheme.error),
              const SizedBox(width: 8.0),
              Text(localizations.deleteCustomer),
            ],
          ),
          content: Text(
            localizations.areYouSureDeleteCustomer(customerName),
            style: theme.textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface.withValues(
                  alpha: 0.7,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(localizations.cancel),
            ),
            TextButton(
              onPressed: () {
                customerProvider.deleteCustomer(customer.id);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      localizations.customerDeletedSuccessfully(customerName),
                    ),
                    backgroundColor: AppTheme.secondaryGreen,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
              child: Text(localizations.delete),
            ),
          ],
        );
      },
    );
  }
}
