import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:loan_management_app/providers/backup_provider.dart';
import 'package:loan_management_app/services/customer_service.dart';
import 'package:loan_management_app/services/loan_service.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'providers/locale_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/all_customers_screen.dart';
import 'screens/add_customer_screen.dart';
import 'screens/create_loan_screen.dart';
import 'screens/overview_loans_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/user_profile_screen.dart';
import 'providers/settings_provider.dart';
import 'providers/customer_provider.dart';
import 'providers/loan_provider.dart';
import 'utils/theme.dart';
import 'utils/navigation_key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize services
  await LoanService.init();
  await CustomerService.init();

  // Wrap the entire app with Phoenix to enable full restart after restore
  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SettingsProvider()),
          ChangeNotifierProvider(create: (context) => CustomerProvider()),
          ChangeNotifierProvider(create: (context) => LoanProvider()),
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
          ChangeNotifierProvider(create: (context) => BackupProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SettingsProvider, LocaleProvider>(
      builder: (context, settings, localeProvider, child) {
        return MaterialApp(
          title: 'Loan Manager',
          locale: localeProvider.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/main': (context) => const MainScreen(),
            '/profile': (context) => const UserProfileScreen(),
          },
        );
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const DashboardScreen(),
    const AllCustomersScreen(),
    const AddCustomerScreen(),
    const CreateLoanScreen(),
    const OverviewLoansScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.exitAppTitle),
            content: Text(AppLocalizations.of(context)!.exitAppMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(AppLocalizations.of(context)!.exit),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _onWillPop().then((shouldPop) {
            if (shouldPop) {
              SystemNavigator.pop();
            }
          });
        }
      },
      child: Scaffold(
        key: mainScreenKey,
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard),
              label: AppLocalizations.of(context)!.dashboard,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people),
              label: AppLocalizations.of(context)!.customers,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_add),
              label: AppLocalizations.of(context)!.addCustomer,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.add_circle),
              label: AppLocalizations.of(context)!.createLoan,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: AppLocalizations.of(context)!.overview,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.primaryBlue,
          unselectedItemColor: AppTheme.textSecondary,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 8.0,
        ),
      ),
    );
  }
}