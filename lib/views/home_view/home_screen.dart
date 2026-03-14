import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_drop/app_widgets/nearby_request_tile.dart';
import 'package:life_drop/app_widgets/urgent_blood_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from the design
    final Color bgColor = const Color(0xFFF7F7F9); // Light background
    final Color primaryRed = const Color(0xFFE53935);
    final Color textDark = const Color(0xFF131A2A);
    final Color textSubtitle = const Color(0xFF5A6B80);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double hPadding = constraints.maxWidth * 0.05;

            return CustomScrollView(
              slivers: [
                // 1. App Bar Area
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo and Text (Left)
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE53935),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons
                                      .water_drop, // Placeholder for the actual drop icon
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'LifeDrop',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: textDark,
                              ),
                            ),
                          ],
                        ),
                        // Search Icon (Right)
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9ECF1), // Light grey circle
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(Icons.search, color: Color(0xFF131A2A)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 2. Profile Area
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 16.0,
                    ),
                    child: Row(
                      children: [
                        // Avatar
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryRed, width: 2),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Jane!',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: textDark,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Text(
                              'Ready to save a life today?',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: textSubtitle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // 3. Availability Toggle Card
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 8.0,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: primaryRed.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Available to Donate',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: textDark,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Receive urgent blood requests nearby',
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: textSubtitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Custom styled toggle switch
                          Container(
                            width: 58,
                            height: 32,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: primaryRed,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 4. Stats Row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 16.0,
                    ),
                    child: Row(
                      children: [
                        // Donations Stats
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBEAEA), // Light red tint
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: primaryRed.withOpacity(0.1),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.history, // Placeholder
                                  color: primaryRed,
                                  size: 24,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '12',
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: textDark,
                                  ),
                                ),
                                Text(
                                  'MY DONATIONS',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF6A798A),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Total Saved Stats
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.bar_chart, // Placeholder
                                  color: Color(0xFFDD3232), // Dark red
                                  size: 24,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  '4.8L',
                                  style: GoogleFonts.poppins(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: textDark,
                                  ),
                                ),
                                Text(
                                  'TOTAL SAVED',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF6A798A),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 5. Emergency Requests Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Emergency Requests',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: textDark,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: primaryRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 6. Emergency Requests List (Horizontal Scroll)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 180, // Height fixed for the card stack
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      scrollDirection: Axis.horizontal,
                      itemCount: 2, // From design
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const UrgentBloodCard(
                            bloodType: 'O+',
                            hospitalName: 'City Hospital',
                            distance: '2.4 km away',
                            timeRemaining: '2h',
                          );
                        } else {
                          return const UrgentBloodCard(
                            bloodType: 'A-',
                            hospitalName: 'Metro Health',
                            distance: '5.1 km away',
                            timeRemaining: '4h',
                          );
                        }
                      },
                    ),
                  ),
                ),

                // 7. Nearby Requests Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 24.0,
                    ).copyWith(bottom: 12.0),
                    child: Text(
                      'Nearby Requests',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textDark,
                      ),
                    ),
                  ),
                ),

                // 8. Nearby Requests List (Vertical)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const NearbyRequestTile(
                        bloodType: 'B+',
                        clinicName: 'St. Mary\'s Clinic',
                        scheduleTime: 'Tomorrow, 10:00 AM',
                      ),
                      const NearbyRequestTile(
                        bloodType: 'AB-',
                        clinicName: 'Hope Medical Center',
                        scheduleTime: 'Friday, 02:00 PM',
                      ),
                    ]),
                  ),
                ),

                // 9. Map Snippet
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 24.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://www.google.com/maps/about/images/treks/map_hero.jpg', // High-res map placeholder
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white54,
                            BlendMode.lighten,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Central Pin
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primaryRed,
                                size: 36,
                              ),
                              Text(
                                'New York',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: textDark,
                                  shadows: [
                                    Shadow(color: Colors.white, blurRadius: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Floating "3 Centers Near You" badge
                          Positioned(
                            bottom: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Text(
                                '3 Centers Near You',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: textDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 24),
                ), // Bottom padding before nav bar
              ],
            );
          },
        ),
      ),

      // Basic Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryRed,
        unselectedItemColor: const Color(0xFF8699B0),
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
