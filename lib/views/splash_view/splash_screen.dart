import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    // Setup animation for the progress bar
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Animate from 0 to 35% (0.35)
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuart),
    );

    _animationController.forward().then((_) {
      // Navigate to the OnboardingScreen after the splash finishes
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOutCubic;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive sizing
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Subtle background gradient/lighting
          Positioned(
            top: -size.height * 0.1,
            left: -size.width * 0.2,
            child: Container(
              width: size.width * 0.7,
              height: size.width * 0.7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.8),
                    AppColors.dangerColor.withOpacity(0.2),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // Logo Circle
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      // Custom painted logo for perfect accuracy
                      child: CustomPaint(
                        size: const Size(50, 65),
                        painter: LogoPainter(color: AppColors.primaryColor),
                      ),
                    ),
                  ),

                  // App Title
                  Text(
                    'LifeDrop',
                    style: AppFonts.headingLarge(
                      color: AppColors.textPrimaryColor,
                      weight: FontWeight.bold,
                      size: 48,
                      letterSpacing: -1.5,
                    ),
                  ),

                  // Subtitle
                  Text(
                    'Every drop counts.',
                    style: AppFonts.bodyLarge(
                      color: AppColors.textSecondaryColor,
                      weight: FontWeight.w500,
                      size: 16,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Progress Bar
                  AnimatedBuilder(
                    animation: _progressAnimation,
                    builder: (context, child) {
                      return Container(
                        width: size.width * 0.6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCEFEF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: _progressAnimation.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom Painter to draw the specific blood drop + ECG line logo
class LogoPainter extends CustomPainter {
  final Color color;

  LogoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final dropPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // 1. Draw the blood drop shape
    final Path dropPath = Path();
    dropPath.moveTo(size.width / 2, 0); // Top point

    // Curve down to the right
    dropPath.quadraticBezierTo(
      size.width,
      size.height * 0.5,
      size.width,
      size.height * 0.75,
    );

    // Bottom semi-circle
    dropPath.arcToPoint(
      Offset(0, size.height * 0.75),
      radius: Radius.circular(size.width / 2),
      clockwise: false,
    );

    // Curve up to the left
    dropPath.quadraticBezierTo(0, size.height * 0.5, size.width / 2, 0);

    canvas.drawPath(dropPath, dropPaint);

    // 2. Draw the ECG heartbeat line inside the drop
    final linePaint = Paint()
      ..color = AppColors.dangerColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double startY = size.height * 0.65;
    final Path linePath = Path();

    // ECG coordinates relative to drop size
    linePath.moveTo(size.width * 0.20, startY);
    linePath.lineTo(size.width * 0.35, startY);
    linePath.lineTo(size.width * 0.45, startY - 8); // Peak up
    linePath.lineTo(size.width * 0.55, startY + 12); // Dip down
    linePath.lineTo(size.width * 0.65, startY - 2); // Small peak up
    linePath.lineTo(size.width * 0.75, startY);
    linePath.lineTo(size.width * 0.85, startY);

    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
