import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/all_customers_screen.dart';
import 'screens/add_customer_screen.dart';
import 'screens/create_loan_screen.dart';
import 'screens/overview_loans_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'providers/settings_provider.dart';
import 'providers/customer_provider.dart';
import 'providers/loan_provider.dart';
import 'utils/theme.dart';
import 'utils/navigation_key.dart';
import 'widgets/custom_bottom_nav_bar.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => CustomerProvider()),
        ChangeNotifierProvider(create: (context) => LoanProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Loan Manager',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
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
    const SettingsScreen(),
  ];

  static final List<BottomNavItem> _navItems = [
    const BottomNavItem(icon: Icons.dashboard, label: 'Dashboard'),
    const BottomNavItem(icon: Icons.people, label: 'Customers'),
    const BottomNavItem(icon: Icons.person_add, label: 'Add Customer'),
    const BottomNavItem(icon: Icons.add_circle, label: 'Create Loan'),
    const BottomNavItem(icon: Icons.list, label: 'Overview'),
    const BottomNavItem(icon: Icons.settings, label: 'Settings'),
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
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Exit'),
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
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
          items: _navItems,
        ),
      ),
    );
  }
}
