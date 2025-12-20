import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme.dart';
import '../main.dart'; // Import to access MainScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();
  final _mpinController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _iconOpacityAnimation;
  late Animation<Offset> _titleSlideAnimation;
  late Animation<Offset> _subtitleSlideAnimation;
  late Animation<Offset> _mobileFieldSlideAnimation;
  late Animation<Offset> _nameFieldSlideAnimation;
  late Animation<Offset> _mpinFieldSlideAnimation;

  final List<Widget> _bubbleWidgets = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _iconScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );

    _iconOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _titleSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
          ),
        );

    _subtitleSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
          ),
        );

    _mobileFieldSlideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
          ),
        );

    _nameFieldSlideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.55, 0.85, curve: Curves.easeOut),
          ),
        );

    _mpinFieldSlideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
          ),
        );

    _animationController.forward();

    // Generate bubble widgets
    final random = Random();
    for (int i = 0; i < 10; i++) {
      final left = random.nextDouble() * 400; // Random left position
      final top = random.nextDouble() * 800; // Random top position
      final size = 20 + random.nextDouble() * 40; // Random size between 20-60
      final duration = Duration(
        seconds: 5 + random.nextInt(5),
      ); // Random duration 5-10 seconds

      _bubbleWidgets.add(
        Positioned(
          left: left,
          top: top,
          child:
              Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.3),
                      shape: BoxShape.circle,
                    ),
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .fadeIn(duration: const Duration(seconds: 1))
                  .moveY(begin: 0, end: -100, duration: duration)
                  .fadeOut(duration: const Duration(seconds: 1)),
        ),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _mobileController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    _mpinController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Save lender details to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lenderName', _nameController.text.trim());
      await prefs.setString('lenderMobile', _mobileController.text.trim());
      await prefs.setString('lenderEmail', _emailController.text.trim());
      await prefs.setString('lenderLocation', _locationController.text.trim());

      if (!mounted) return;

      // Navigate to MainScreen (dashboard)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryBlue, AppTheme.secondaryGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Animated bubbles
          ..._bubbleWidgets,
          // Login form
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // App Logo or Icon
                        ScaleTransition(
                          scale: _iconScaleAnimation,
                          child: FadeTransition(
                            opacity: _iconOpacityAnimation,
                            child: Icon(
                              Icons.account_balance_wallet,
                              size: 80.0,
                              color: AppTheme.primaryBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        SlideTransition(
                          position: _titleSlideAnimation,
                          child: Text(
                            'Loan Manager',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryBlue,
                                ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        SlideTransition(
                          position: _subtitleSlideAnimation,
                          child: Text(
                            'Secure Login',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: AppTheme.textSecondary),
                          ),
                        ),
                        const SizedBox(height: 32.0),
                        // Mobile Number Field
                        SlideTransition(
                          position: _mobileFieldSlideAnimation,
                          child: TextFormField(
                            controller: _mobileController,
                            decoration: const InputDecoration(
                              labelText: 'Mobile Number',
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Enter your mobile number',
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              if (value.length != 10 ||
                                  !RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Enter a valid 10-digit mobile number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Name Field
                        SlideTransition(
                          position: _nameFieldSlideAnimation,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Enter your name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter your email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        // Location Field
                        TextFormField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            labelText: 'Location',
                            prefixIcon: Icon(Icons.location_on),
                            hintText: 'Enter your location',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your location';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        // M-PIN Field
                        SlideTransition(
                          position: _mpinFieldSlideAnimation,
                          child: TextFormField(
                            controller: _mpinController,
                            decoration: const InputDecoration(
                              labelText: 'M-PIN',
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Enter your M-PIN',
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your M-PIN';
                              }
                              if (value.length < 4 || value.length > 6) {
                                return 'M-PIN must be 4-6 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        // Login Button
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 16.0),
                        // Forgot M-PIN (placeholder)
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot M-PIN?'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
