import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';
import '../providers/settings_provider.dart';
import '../services/loan_service.dart';
import '../services/customer_service.dart';
import '../utils/theme.dart';
import 'add_customer_screen.dart';
import 'create_loan_screen.dart';
import 'emi_ledger_screen.dart';
import 'all_pdf_screen.dart';
import 'user_profile_screen.dart';
import 'settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // 22 Official Indian Languages (alphabetical)
  static const List<String> indianLanguages = [
    'Assamese',
    'Bengali',
    'English',
    'Gujarati',
    'Hindi',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Nepali',
    'Odia',
    'Punjabi',
    'Tamil',
    'Telugu',
    'Urdu',
  ];

  // Language to flag emoji map
  static const Map<String, String> languageFlags = {
    'English': '🇺🇸',
    'Hindi': '🇮🇳',
    'Assamese': '🇮🇳',
    'Bengali': '🇮🇳',
    'Gujarati': '🇮🇳',
    'Kannada': '🇮🇳',
    'Malayalam': '🇮🇳',
    'Marathi': '🇮🇳',
    'Punjabi': '🇮🇳',
    'Tamil': '🇮🇳',
    'Telugu': '🇮🇳',
    'Urdu': '🇵🇰',
    'Odia': '🇮🇳',
    'Nepali': '🇳🇵',
  };

  String _userName = 'User';
  String? _profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('lenderName') ?? 'User';
      _profileImagePath = prefs.getString('profileImagePath');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu),
          onSelected: (value) {
            if (value == 'profile') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
                ),
              ).then((_) => _loadUserProfile());
            } else if (value == 'settings') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            } else if (value == 'languages') {
              _showLanguagePicker(context);
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, color: AppTheme.primaryBlue),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.userProfile),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'settings',
              child: Row(
                children: [
                  Icon(Icons.settings, color: AppTheme.primaryBlue),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.settings),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'languages',
              child: Row(
                children: [
                  Icon(Icons.language, color: AppTheme.primaryBlue),
                  const SizedBox(width: 12),
                  Text(AppLocalizations.of(context)!.languages),
                ],
              ),
            ),
          ],
        ),
        title: Text(AppLocalizations.of(context)!.dashboardTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadUserProfile,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section - Profile Photo & Greeting
              Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          blurRadius: 25,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.primaryBlue.withValues(alpha: 0.9),
                                    AppTheme.secondaryGreen.withValues(
                                      alpha: 0.9,
                                    ),
                                  ],
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.25),
                                    blurRadius: 20,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Builder(
                                builder: (context) {
                                  final hasValidImage =
                                      _profileImagePath != null &&
                                      File(_profileImagePath!).existsSync();
                                  return CircleAvatar(
                                    radius: 48,
                                    backgroundColor: Colors.white,
                                    backgroundImage: hasValidImage
                                        ? FileImage(File(_profileImagePath!))
                                        : null,
                                    child: hasValidImage
                                        ? null
                                        : Icon(
                                            Icons.person,
                                            size: 56,
                                            color: AppTheme.primaryBlue,
                                          ),
                                  );
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UserProfileScreen(),
                                  ),
                                ).then((_) => _loadUserProfile());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(
                                  bottom: 4,
                                  right: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: AppTheme.primaryBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context)!.helloUser(_userName),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                offset: Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalizations.of(context)!.welcomeBack,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
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
                    AppLocalizations.of(context)!.keyMetrics,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
                          AppLocalizations.of(context)!.totalLoans,
                          LoanService().getLoans().length.toString(),
                          Icons.account_balance,
                          AppTheme.primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: _buildMetricCard(
                          context,
                          AppLocalizations.of(context)!.activeLoans,
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
                          AppLocalizations.of(context)!.totalCustomers,
                          CustomerService().getCustomers().length.toString(),
                          Icons.people,
                          AppTheme.accentGreen,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: _buildMetricCard(
                          context,
                          AppLocalizations.of(context)!.pendingEMIs,
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
                          AppLocalizations.of(context)!.totalLoanAmount,
                          '₹${LoanService().getTotalLoanAmount().toStringAsFixed(2)}',
                          Icons.account_balance_wallet,
                          AppTheme.primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: _buildMetricCard(
                          context,
                          AppLocalizations.of(context)!.totalProfit,
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
                    AppLocalizations.of(context)!.quickActions,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
                          AppLocalizations.of(context)!.addCustomer,
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
                          AppLocalizations.of(context)!.createLoan,
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
                          AppLocalizations.of(context)!.emiLedger,
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
                        child: _buildActionButton(
                          context,
                          AppLocalizations.of(context)!.pdfDocuments,
                          Icons.picture_as_pdf,
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPDFScreen(),
                            ),
                          ),
                        ),
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
                    AppLocalizations.of(context)!.recentActivity,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
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
      ),
    );
  }

  int _getActiveLoansCount() {
    final now = DateTime.now();
    return LoanService()
        .getLoans()
        .where(
          (loan) =>
              loan.startDate.isBefore(now) &&
              loan.endDate.isAfter(now) &&
              !LoanService().isLoanCompleted(loan.id),
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

  // --------------------- BEAUTIFUL LANGUAGE PICKER ---------------------
  void _showLanguagePicker(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(
      context,
      listen: false,
    );
    String previewSelected = settingsProvider.currentLanguage;
    String searchQuery = '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.26),
                blurRadius: 20,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.primaryBlue,
                              AppTheme.secondaryGreen,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.selectLanguage,
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryBlue,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 3,
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.primaryBlue,
                                    AppTheme.secondaryGreen,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Search Field
                  TextField(
                    onChanged: (value) =>
                        setModalState(() => searchQuery = value.toLowerCase()),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.selectLanguage,
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                              onPressed: () =>
                                  setModalState(() => searchQuery = ''),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: AppTheme.primaryBlue,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.5),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Language List
                  Expanded(
                    child: _getFilteredLanguages(searchQuery).isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  AppLocalizations.of(context)!.noLanguageMatch,
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: _getFilteredLanguages(
                              searchQuery,
                            ).length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final lang = _getFilteredLanguages(
                                searchQuery,
                              )[index];
                              final isSelected = previewSelected == lang;
                              return _buildLanguageCard(
                                context,
                                lang,
                                isSelected,
                                () =>
                                    setModalState(() => previewSelected = lang),
                                () {
                                  settingsProvider.setLanguage(
                                    lang,
                                    context: context,
                                  );
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.languageSelected(lang),
                                      ),
                                      backgroundColor: AppTheme.primaryBlue,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _getFilteredLanguages(String query) {
    if (query.isEmpty) return indianLanguages;
    return indianLanguages
        .where((lang) => lang.toLowerCase().contains(query))
        .toList();
  }

  String _getLanguageKey(String lang) {
    return lang.split(' ')[0];
  }

  Widget _buildLanguageCard(
    BuildContext context,
    String language,
    bool isSelected,
    VoidCallback onHover,
    VoidCallback onTap,
  ) {
    final flag = languageFlags[_getLanguageKey(language)] ?? '🌐';
    return GestureDetector(
      onTapDown: (_) => onHover(),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    AppTheme.surfaceGrey.withValues(alpha: 0.5),
                  ],
                ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: (isSelected ? AppTheme.primaryBlue : Colors.black)
                  .withValues(alpha: 0.2),
              blurRadius: isSelected ? 20 : 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(flag, style: const TextStyle(fontSize: 24)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w600,
                      color: isSelected ? Colors.white : AppTheme.textPrimary,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.selected,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: Colors.white, size: 24)
            else
              Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.textSecondary,
                size: 16,
              ),
          ],
        ),
      ).animate().scale(duration: 200.ms, curve: Curves.easeOut).fadeIn(),
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
        child:  Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(AppLocalizations.of(context)!.noRecentActivity),
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
