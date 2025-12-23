import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _backgroundController;
  late PageController _pageController;
  int _currentPage = 0;
  final int _totalSlides = 3;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _textController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Start animations
    _backgroundController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _logoController.forward();
    });
    Future.delayed(const Duration(seconds: 1), () {
      _textController.forward();
    });

    // Auto-advance slides
    _startSlideTimer();
  }

  void _startSlideTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < _totalSlides - 1) {
        setState(() {
          _currentPage++;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startSlideTimer();
      } else {
        // Navigate to login after last slide
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _backgroundController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildSlide(int index) {
    switch (index) {
      case 0:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Transform.scale(
                      scale: _logoController.value,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.white, AppTheme.primaryBlue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    )
                    .animate(controller: _logoController)
                    .rotate(
                      begin: 0,
                      end: 0.1,
                      duration: const Duration(milliseconds: 500),
                    )
                    .then()
                    .rotate(
                      begin: 0.1,
                      end: -0.1,
                      duration: const Duration(milliseconds: 500),
                    )
                    .then()
                    .rotate(
                      begin: -0.1,
                      end: 0,
                      duration: const Duration(milliseconds: 500),
                    );
              },
            ),

            const SizedBox(height: 40),

            // Animated text
            AnimatedBuilder(
              animation: _textController,
              builder: (context, child) {
                return Opacity(
                  opacity: _textController.value,
                  child: Column(
                    children: [
                      Text(
                        'Welcome to Loan Manager',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Your trusted partner for loan management',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      case 1:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.track_changes, size: 100, color: Colors.white)
                .animate()
                .scaleXY(begin: 0, end: 1, duration: const Duration(seconds: 1))
                .then()
                .shake(duration: const Duration(milliseconds: 500)),

            const SizedBox(height: 40),

            Text(
                  'Track Loans & EMI Easily',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: const Duration(seconds: 1))
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: const Duration(seconds: 1),
                ),

            const SizedBox(height: 16),

            Text(
                  'Monitor your loan progress and EMI schedules in real-time',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                )
                .animate()
                .fadeIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(seconds: 1),
                )
                .slideY(
                  begin: 0.5,
                  end: 0,
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(seconds: 1),
                ),
          ],
        );
      case 2:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.security, size: 100, color: Colors.white)
                .animate()
                .scaleXY(begin: 0, end: 1, duration: const Duration(seconds: 1))
                .then()
                .scaleXY(
                  begin: 1,
                  end: 1.2,
                  duration: const Duration(milliseconds: 250),
                )
                .then()
                .scaleXY(
                  begin: 1.2,
                  end: 1,
                  duration: const Duration(milliseconds: 250),
                ),

            const SizedBox(height: 40),

            Text(
                  'Secure & Reliable',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: const Duration(seconds: 1))
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: const Duration(seconds: 1),
                ),

            const SizedBox(height: 16),

            Text(
                  'Your data is protected with industry-standard security',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                )
                .animate()
                .fadeIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(seconds: 1),
                )
                .slideY(
                  begin: 0.5,
                  end: 0,
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(seconds: 1),
                ),

            const SizedBox(height: 40),

            // Loading indicator
            SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withValues(alpha: 0.8),
                    ),
                    strokeWidth: 3,
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .rotate(begin: 0, end: 1, duration: const Duration(seconds: 2)),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background gradient
          AnimatedBuilder(
            animation: _backgroundController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.primaryBlue.withValues(alpha: 0.8),
                      AppTheme.secondaryGreen.withValues(alpha: 0.8),
                      Colors.purple.withValues(alpha: 0.6),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, _backgroundController.value * 0.5 + 0.5, 1.0],
                  ),
                ),
              );
            },
          ),

          // Floating particles
          ...List.generate(20, (index) {
            return Positioned(
              left: (index * 50.0) % MediaQuery.of(context).size.width,
              top: (index * 70.0) % MediaQuery.of(context).size.height,
              child:
                  Container(
                        width: 4 + (index % 3) * 2.0,
                        height: 4 + (index % 3) * 2.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                        ),
                      )
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .fadeIn(duration: const Duration(seconds: 1))
                      .scaleXY(
                        begin: 1.0,
                        end: 1.5,
                        duration: Duration(seconds: 2 + index % 2),
                      )
                      .moveY(
                        begin: 0,
                        end: -20,
                        duration: Duration(seconds: 3 + index % 3),
                      ),
            );
          }),

          // PageView for slides
          PageView.builder(
            controller: _pageController,
            itemCount: _totalSlides,
            itemBuilder: (context, index) {
              return Center(child: _buildSlide(index));
            },
          ),

          // Page indicators
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalSlides,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          // Bottom text
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child:
                Text(
                      'Secure • Reliable • Efficient',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    )
                    .animate()
                    .fadeIn(
                      delay: const Duration(seconds: 2),
                      duration: const Duration(seconds: 1),
                    )
                    .slideY(
                      begin: 1,
                      end: 0,
                      delay: const Duration(seconds: 2),
                      duration: const Duration(seconds: 1),
                    ),
          ),
        ],
      ),
    );
  }
}
