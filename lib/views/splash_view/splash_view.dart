import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_assets.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/core/routes/route_names.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  Future<void> _checkUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      Navigator.pushReplacementNamed(context, RouteNames.onboardingView);
      return;
    }

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    final userData = doc.data();

    if (userData == null) {
      Navigator.pushReplacementNamed(context, RouteNames.loginView);
      return;
    }

    final role = userData['role'];

    if (role == "Donor") {
      Navigator.pushReplacementNamed(context, RouteNames.donorBottomNavView);
    } else {
      Navigator.pushReplacementNamed(
        context,
        RouteNames.recipientBottomNavView,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutQuart),
    );

    _animationController.forward().then((_) async {
      if (mounted) {
        await _checkUser();
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          /// Logo + Title + Subtitle — perfectly centered
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppAssets.splashLogo, height: size.height * 0.15),

                SizedBox(height: size.height * 0.015),

                Text(
                  'LifeDrop',
                  style: AppFonts.headingLarge(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                    size: size.width * 0.12,
                    letterSpacing: -1.5,
                  ),
                ),

                SizedBox(height: size.height * 0.005),

                Text(
                  'Every drop counts.',
                  style: AppFonts.bodyLarge(
                    color: AppColors.textSecondaryColor,
                    weight: FontWeight.w500,
                    size: size.width * 0.04,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),

          /// Progress Bar — pinned to the bottom
          Positioned(
            bottom: size.height * 0.05,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _progressAnimation,
              builder: (context, child) {
                return Center(
                  child: Container(
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
