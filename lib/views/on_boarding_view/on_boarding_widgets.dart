import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ─────────────────────────────────────────────────────────────────────────────
// TOP BAR
// ─────────────────────────────────────────────────────────────────────────────

class OnboardingTopBar extends StatelessWidget {
  const OnboardingTopBar({
    super.key,
    required this.currentIndex,
    required this.onBack,
    required this.onSkip,
  });

  final int currentIndex;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final double hp = MediaQuery.of(context).size.width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hp, vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Back button — only on pages 2 & 3
          if (currentIndex > 0)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
                onPressed: onBack,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),

          // Centered brand title — only on pages 2 & 3
          if (currentIndex > 0)
            Text(
              'LifeDrop',
              style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
            ),

          // Skip button — always visible
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Skip',
                style: AppFonts.bodyLarge(
                  color: AppColors.primaryColor,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP CONTENT  (image + title + subtitle)
// ─────────────────────────────────────────────────────────────────────────────

class OnboardingStepContent extends StatelessWidget {
  const OnboardingStepContent({
    super.key,
    required this.constraints,
    required this.title,
    required this.subtitle,
    required this.imageSection,
  });

  final BoxConstraints constraints;
  final String title;
  final String subtitle;
  final Widget imageSection;

  @override
  Widget build(BuildContext context) {
    final isSmall = constraints.maxHeight < 700;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
      child: Column(
        children: [
          SizedBox(height: isSmall ? 0 : 10),
          Expanded(child: imageSection),
          SizedBox(height: isSmall ? 24 : 48),

          // Title
          Text(
            title,
            style: AppFonts.headingLarge(
              color: AppColors.textPrimaryColor,
              size: isSmall ? 26 : 30,
              weight: FontWeight.w700,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Subtitle
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.04,
            ),
            child: Text(
              subtitle,
              style: AppFonts.bodyMedium(
                color: AppColors.textSecondaryColor,
                size: isSmall ? 14 : 15,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// BOTTOM NAV  (indicator + button + sign-in link)
// ─────────────────────────────────────────────────────────────────────────────

class OnboardingBottomNav extends StatelessWidget {
  const OnboardingBottomNav({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.isSmall,
    required this.onNext,
    required this.onSignIn,
  });

  final PageController pageController;
  final int currentIndex;
  final bool isSmall;
  final VoidCallback onNext;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final double hp = MediaQuery.of(context).size.width * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hp,
        vertical: isSmall ? 16 : 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Page indicator dots
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primaryColor,
              dotColor: AppColors.primaryColor.withOpacity(0.2),
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
              spacing: 8,
            ),
          ),

          SizedBox(height: isSmall ? 24 : 32),

          // Next / Get Started button
          OnboardingNextButton(
            label: currentIndex == 2 ? 'Get Started' : 'Next',
            onTap: onNext,
          ),

          SizedBox(height: isSmall ? 16 : 24),

          // Sign In link (last page) or bottom pill decoration
          if (currentIndex == 2)
            TextButton(
              onPressed: onSignIn,
              child: Text(
                'Sign In',
                style: AppFonts.bodyLarge(
                  color: AppColors.textSecondaryColor,
                  weight: FontWeight.w500,
                ),
              ),
            )
          else
            Container(
              width: 140,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.textSecondaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// NEXT BUTTON
// ─────────────────────────────────────────────────────────────────────────────

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppFonts.bodyLarge(
                color: AppColors.cardColor,
                weight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.cardColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 1 — Find Blood Donors (Map + Pins)
// ─────────────────────────────────────────────────────────────────────────────

class Step1ImageArea extends StatelessWidget {
  const Step1ImageArea({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
            'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(137, 50, 43, 43),
            BlendMode.lighten,
          ),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: constraints.maxHeight * 0.08,
            left: constraints.maxWidth * 0.35,
            child: const _LocationPin(),
          ),
          Positioned(
            top: constraints.maxHeight * 0.15,
            left: constraints.maxWidth * 0.35,
            child: const BloodTypePin(label: 'O-'),
          ),
          Positioned(
            top: constraints.maxHeight * 0.18,
            left: constraints.maxWidth * 0.55,
            child: const BloodTypePin(label: 'A+'),
          ),
        ],
      ),
    );
  }
}

class _LocationPin extends StatelessWidget {
  const _LocationPin();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: AppColors.cardColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: const Center(
        child: Icon(Icons.location_on, color: AppColors.primaryColor, size: 28),
      ),
    );
  }
}

class BloodTypePin extends StatelessWidget {
  const BloodTypePin({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        label,
        style: AppFonts.bodyMedium(
          color: AppColors.cardColor,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 2 — Donate & Save Lives (Doctor photo + Impact card)
// ─────────────────────────────────────────────────────────────────────────────

class Step2ImageArea extends StatelessWidget {
  const Step2ImageArea({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Doctor photo
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF67A6AD),
            borderRadius: BorderRadius.circular(36),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=2664&auto=format&fit=crop',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Floating impact card
        Positioned(
          bottom: 4,
          right: constraints.maxWidth * 0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Heart circle
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAE9E9),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'IMPACT',
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                        weight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '+1 Life Saved',
                      style: AppFonts.bodyMedium(
                        color: AppColors.textPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STEP 3 — Emergency Requests (Phone mockup + bell)
// ─────────────────────────────────────────────────────────────────────────────

class Step3ImageArea extends StatelessWidget {
  const Step3ImageArea({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final isSmall = constraints.maxHeight < 700;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD6DAD3),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Phone frame
          Container(
            width: constraints.maxWidth * 0.65,
            height: constraints.maxHeight * 0.4,
            decoration: BoxDecoration(
              color: const Color(0xFF38665E),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF453D3D), width: 6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Soft inner circle
                Container(
                  width: constraints.maxWidth * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04),
                    shape: BoxShape.circle,
                  ),
                ),

                // Glowing bell
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 56,
                    ),
                  ),
                ),

                // Bottom notification bar inside phone
                Positioned(
                  bottom: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 80,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE56A54),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Phone notch
          Positioned(
            top: constraints.maxHeight * (isSmall ? 0.04 : 0.08),
            child: Container(
              width: 80,
              height: 15,
              decoration: const BoxDecoration(
                color: Color(0xFF453D3D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 20,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
