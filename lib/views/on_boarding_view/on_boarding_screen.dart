import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  void _onBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _goToHome() {
    Navigator.of(context).pushReplacementNamed(RouteNames.donorHomeView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 700;

            return Column(
              children: [
                // ── Top bar ──────────────────────────────────────
                OnboardingTopBar(
                  currentIndex: _currentIndex,
                  onBack: _onBack,
                  onSkip: _goToHome,
                ),

                // ── Pages ────────────────────────────────────────
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) => setState(() => _currentIndex = i),
                    children: [
                      OnboardingStepContent(
                        constraints: constraints,
                        title: 'Find Blood Donors',
                        subtitle:
                            'Quickly find verified blood donors\nnear your location in times of need.',
                        imageSection: Step1ImageArea(constraints: constraints),
                      ),
                      OnboardingStepContent(
                        constraints: constraints,
                        title: 'Donate & Save Lives',
                        subtitle:
                            'Your donation can be the reason for\nsomeone\'s heartbeat. Track your impact\nand history in real-time.',
                        imageSection: Step2ImageArea(constraints: constraints),
                      ),
                      OnboardingStepContent(
                        constraints: constraints,
                        title: 'Emergency Requests',
                        subtitle:
                            'Post urgent blood requests and reach\nhundreds of donors instantly. We bridge\nthe gap when every second counts.',
                        imageSection: Step3ImageArea(constraints: constraints),
                      ),
                    ],
                  ),
                ),

                // ── Bottom nav ───────────────────────────────────
                OnboardingBottomNav(
                  pageController: _pageController,
                  currentIndex: _currentIndex,
                  isSmall: isSmall,
                  onNext: _onNext,
                  onSignIn: _goToHome,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
