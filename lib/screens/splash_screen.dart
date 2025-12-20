import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              Icon(
                    Icons.account_balance_wallet,
                    size: 120.0,
                    color: Colors.white,
                  )
                  .animate()
                  .scale(duration: 800.ms, curve: Curves.elasticOut)
                  .fadeIn(duration: 500.ms),

              const SizedBox(height: 24.0),

              // Animated App Name
              Text(
                    'Loan Manager',
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                  .animate()
                  .slideY(begin: 1.0, end: 0.0, duration: 600.ms, delay: 200.ms)
                  .fadeIn(duration: 600.ms, delay: 200.ms),

              const SizedBox(height: 16.0),

              // Animated Subtitle
              Text(
                    'Manage Your Loans Effortlessly',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  )
                  .animate()
                  .slideY(begin: 1.0, end: 0.0, duration: 600.ms, delay: 400.ms)
                  .fadeIn(duration: 600.ms, delay: 400.ms),

              const SizedBox(height: 48.0),

              // Animated Loading Indicator
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ).animate().fadeIn(duration: 800.ms, delay: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
