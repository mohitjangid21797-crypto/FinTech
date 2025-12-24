import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/customer_provider.dart';
import '../widgets/customer_card.dart';
import '../utils/theme.dart';
import 'add_customer_screen.dart';

class AllCustomersScreen extends StatefulWidget {
  const AllCustomersScreen({super.key});

  @override
  State<AllCustomersScreen> createState() => _AllCustomersScreenState();
}

class _AllCustomersScreenState extends State<AllCustomersScreen>
    with TickerProviderStateMixin {
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
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search customers...',
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest
                      .withValues(alpha: 0.3),
                  prefixIcon: Icon(
                    Icons.search,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                ),
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontSize: 18.0,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              )
            : Text(
                'All Customers',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppTheme.primaryBlue,
                ),
              ),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        actions: [
          IconButton(
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
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddCustomerScreen(),
                ),
              );
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
      body: Consumer<CustomerProvider>(
        builder: (context, customerProvider, child) {
          final allCustomers = customerProvider.customers;
          final filteredCustomers =
              _isSearching && _searchController.text.isNotEmpty
              ? allCustomers.where((customer) {
                  final query = _searchController.text.toLowerCase();
                  return customer.name.toLowerCase().contains(query) ||
                      customer.mobile.toLowerCase().contains(query) ||
                      customer.email.toLowerCase().contains(query) ||
                      customer.location.toLowerCase().contains(query);
                }).toList()
              : allCustomers;

          if (allCustomers.isEmpty) {
            return _buildEmptyState(context, theme);
          }

          if (filteredCustomers.isEmpty && _isSearching) {
            return _buildNoSearchResults(context, theme);
          }

          return RefreshIndicator(
            onRefresh: () async {
              // Simulate refresh - in real app, this would reload data
              await Future.delayed(const Duration(seconds: 1));
              setState(() {});
            },
            color: AppTheme.primaryBlue,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 88.0), // Space for FAB
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
                                _fabAnimationController,
                            curve: Interval(0.0, 1.0, curve: Curves.easeOut),
                          ),
                        ),
                    child: CustomerCard(
                      customer: customer,
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddCustomerScreen(customer: customer),
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
          );
        },
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabAnimation,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddCustomerScreen(),
              ),
            );
          },
          icon: const Icon(Icons.person_add),
          label: const Text('Add Customer'),
          backgroundColor: AppTheme.primaryBlue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
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
              'No Customers Yet',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Start building your customer database by adding your first customer.',
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
              label: const Text('Add Your First Customer'),
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

  Widget _buildNoSearchResults(BuildContext context, ThemeData theme) {
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
              'No Results Found',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Try adjusting your search terms or check the spelling.',
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
              const Text('Delete Customer'),
            ],
          ),
          content: Text(
            'Are you sure you want to delete ${customer.name}? This action cannot be undone.',
            style: theme.textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                customerProvider.deleteCustomer(customer.id);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${customer.name} deleted successfully'),
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
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
