import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_drop/views/home_view/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  // Colors extracted from design
  final Color bgColor = const Color(0xFFF7F7F9);
  final Color primaryRed = const Color(0xFFE53935);
  final Color textDark = const Color(0xFF131A2A);
  final Color textSubtitle = const Color(0xFF5A6B80);
  final Color dotInactive = const Color(0xFFF1C7C7);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  void _onSkipPressed() {
    _navigateToHome();
  }

  void _navigateToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Determine sizing factor based on screen height
            final isSmallScreen = constraints.maxHeight < 700;
            final double horizontalPadding =
                constraints.maxWidth * 0.06; // Adaptive padding

            return Column(
              children: [
                // Custom Top Bar Area (changes based on page)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 8.0,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Back button (Only Step 2/3)
                      if (_currentPageIndex > 0)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black87,
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),

                      // Title (Only Step 2/3)
                      if (_currentPageIndex > 0)
                        Text(
                          'LifeDrop',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: textDark,
                          ),
                        ),

                      // Skip Button (Always visible)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _onSkipPressed,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Skip',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: primaryRed,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Expanding PageView Area
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: [
                      // --- STEP 1: Find Blood Donors ---
                      _buildStep(
                        constraints: constraints,
                        title: 'Find Blood Donors',
                        subtitle:
                            'Quickly find verified blood donors\nnear your location in times of need.',
                        imageSection: _buildStep1ImageArea(constraints),
                      ),

                      // --- STEP 2: Donate & Save Lives ---
                      _buildStep(
                        constraints: constraints,
                        title: 'Donate & Save Lives',
                        subtitle:
                            'Your donation can be the reason for\nsomeone\'s heartbeat. Track your impact and\nhistory in real-time.',
                        imageSection: _buildStep2ImageArea(constraints),
                      ),

                      // --- STEP 3: Emergency Requests ---
                      _buildStep(
                        constraints: constraints,
                        title: 'Emergency Requests',
                        subtitle:
                            'Post urgent blood requests and reach\nhundreds of donors instantly in emergency\nsituations. We bridge the gap when every\nsecond counts.',
                        imageSection: _buildStep3ImageArea(constraints),
                      ),
                    ],
                  ),
                ),

                // Bottom Nav Area (Indicator & Next Button)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: isSmallScreen ? 16.0 : 24.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Smooth Page Indicator
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: primaryRed,
                          dotColor: dotInactive,
                          dotHeight: 8,
                          dotWidth: 8,
                          expansionFactor: 3, // Makes the active dot wider
                          spacing: 8,
                        ),
                      ),

                      SizedBox(height: isSmallScreen ? 24 : 32),

                      // Next Button
                      Container(
                        width: double.infinity,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: primaryRed.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: _onNextPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryRed,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _currentPageIndex == 2 ? 'Get Started' : 'Next',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: isSmallScreen ? 16 : 24),

                      // Bottom Link or Indicator line
                      if (_currentPageIndex == 2)
                        TextButton(
                          onPressed: _navigateToHome,
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: textSubtitle,
                            ),
                          ),
                        )
                      else
                        Container(
                          width: 140,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Generic Step Layout
  Widget _buildStep({
    required BoxConstraints constraints,
    required String title,
    required String subtitle,
    required Widget imageSection,
  }) {
    final isSmallScreen = constraints.maxHeight < 700;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
      child: Column(
        children: [
          SizedBox(height: isSmallScreen ? 0 : 10),
          // Image / Illustration
          Expanded(child: imageSection),

          SizedBox(height: isSmallScreen ? 24 : 48), // Spacing below image
          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isSmallScreen ? 26 : 30, // Adaptive size
              fontWeight: FontWeight.w700,
              color: textDark,
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
              style: GoogleFonts.inter(
                fontSize: isSmallScreen ? 14 : 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF5A6B80),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // ============== STEP 1 SPECIFIC UI ==============
  Widget _buildStep1ImageArea(BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        // Using a similar map placeholder
        image: const DecorationImage(
          image: NetworkImage(
            'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white54, BlendMode.lighten),
        ),
      ),
      child: Stack(
        children: [
          // Center Location Pin
          Positioned(
            top: constraints.maxHeight * 0.08,
            left: constraints.maxWidth * 0.35,
            child: _buildMainPin(),
          ),

          // O- Blood Type Pin
          Positioned(
            top: constraints.maxHeight * 0.15,
            left: constraints.maxWidth * 0.35,
            child: _buildBloodTypePin('O-', primaryRed),
          ),

          // A+ Blood Type Pin
          Positioned(
            top: constraints.maxHeight * 0.18,
            left: constraints.maxWidth * 0.55,
            child: _buildBloodTypePin('A+', primaryRed),
          ),
        ],
      ),
    );
  }

  Widget _buildMainPin() {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Center(
        child: Icon(Icons.location_on, color: primaryRed, size: 28),
      ),
    );
  }

  Widget _buildBloodTypePin(String type, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        type,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
    );
  }

  // ============== STEP 2 SPECIFIC UI ==============
  Widget _buildStep2ImageArea(BoxConstraints constraints) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        // Doctor Image Container
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.only(
            bottom: 24,
          ), // Leave space for shadow of floating card
          decoration: BoxDecoration(
            // A tealish background color similar to the image
            color: const Color(0xFF67A6AD),
            borderRadius: BorderRadius.circular(36),
            // Placeholder for the doctor
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=2664&auto=format&fit=crop',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Impact Card overlay
        Positioned(
          bottom: 4,
          right: constraints.maxWidth * 0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
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
                // Heart Circle
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFAE9E9), // Light pink like splash
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: primaryRed, // #e53935 red
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                // Impact Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'IMPACT',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF8699B0), // lighter grey
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '+1 Life Saved',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textDark, // dark blue/black
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

  // ============== STEP 3 SPECIFIC UI ==============
  Widget _buildStep3ImageArea(BoxConstraints constraints) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xFFD6DAD3,
        ), // Subtle greenish grey matching edge of phone
        borderRadius: BorderRadius.circular(36),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simulated phone frame
          Container(
            width: constraints.maxWidth * 0.65,
            height: constraints.maxHeight * 0.4,
            decoration: BoxDecoration(
              color: const Color(0xFF38665E), // Phone screen background color
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF453D3D), // Phone border color
                width: 6,
              ),
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
                // Inner concentric circles
                Container(
                  width: constraints.maxWidth * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.04), // soft inner circle
                    shape: BoxShape.circle,
                  ),
                ),

                // Red glowing bell background
                Container(
                  width:
                      120, // fixed size to ensure it matches the layout visually
                  height: 120,
                  decoration: BoxDecoration(
                    color: primaryRed,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryRed.withOpacity(0.5),
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

                // Small bottom notification indicator inside the phone screen
                Positioned(
                  bottom: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Simulated text scribbles
                      Container(
                        width: 80,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Alert dot
                      Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Color(
                            0xFFE56A54,
                          ), // slightly different orange/red alert
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

          // Simulated top notch for phone
          Positioned(
            top:
                constraints.maxHeight *
                (constraints.maxHeight < 700 ? 0.04 : 0.08),
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
