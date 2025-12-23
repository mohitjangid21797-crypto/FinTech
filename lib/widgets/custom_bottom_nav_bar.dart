import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<BottomNavItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.items,
  });

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  final Map<int, bool> _isTapped = {};
  late Map<int, AnimationController> _itemAnimations;

  @override
  void initState() {
    super.initState();
    _itemAnimations = {};
    for (int i = 0; i < widget.items.length; i++) {
      _itemAnimations[i] = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      );
    }
  }

  @override
  void didUpdateWidget(CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _itemAnimations[oldWidget.selectedIndex]?.reverse();
      _itemAnimations[widget.selectedIndex]?.forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _itemAnimations.values) {
      controller.dispose();
    }
    _itemAnimations.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _isTapped[index] = true;
              });
              widget.onItemTapped(index);
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  _isTapped[index] = false;
                });
              });
            },
            child: AnimatedScale(
              scale: (_isTapped[index] ?? false) ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Color.lerp(
                    Colors.transparent,
                    theme.colorScheme.primary.withAlpha(25),
                    _itemAnimations[index]?.value ?? 0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBuilder(
                      animation: _itemAnimations[index]!,
                      builder: (context, child) {
                        final animationValue = _itemAnimations[index]!.value;
                        return Transform.scale(
                          scale: 1.0 + (0.2 * animationValue),
                          child: Icon(
                            item.icon,
                            color: Color.lerp(
                              theme.colorScheme.onSurface.withAlpha(
                                153,
                              ), // 0.6 * 255
                              theme.colorScheme.primary,
                              animationValue,
                            ),
                            size: 24,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    AnimatedBuilder(
                      animation: _itemAnimations[index]!,
                      builder: (context, child) {
                        final animationValue = _itemAnimations[index]!.value;
                        return Text(
                          item.label,
                          style: TextStyle(
                            color: Color.lerp(
                              theme.colorScheme.onSurface.withAlpha(153),
                              theme.colorScheme.primary,
                              animationValue,
                            ),
                            fontSize: 10 + (2 * animationValue),
                            fontWeight: FontWeight.lerp(
                              FontWeight.w400,
                              FontWeight.w600,
                              animationValue,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 1, end: 0);
  }
}

class BottomNavItem {
  final IconData icon;
  final String label;

  const BottomNavItem({required this.icon, required this.label});
}
