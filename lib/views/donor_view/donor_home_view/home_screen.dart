import 'package:flutter/material.dart';
import 'package:life_drop/app_widgets/nearby_request_tile.dart';
import 'package:life_drop/app_widgets/urgent_blood_card.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/views/donor_view/donor_home_view/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double hPadding = constraints.maxWidth * 0.05;

            return CustomScrollView(
              slivers: [
                // 1. App Bar
                SliverToBoxAdapter(child: HomeAppBar(hPadding: hPadding)),

                // 2. Profile Header
                SliverToBoxAdapter(
                  child: HomeProfileHeader(
                    hPadding: hPadding,
                    name: 'Jane',
                    subtitle: 'Ready to save a life today?',
                    avatarUrl:
                        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop',
                  ),
                ),

                // 3. Availability Toggle Card
                SliverToBoxAdapter(
                  child: DonationAvailabilityCard(hPadding: hPadding),
                ),

                // 4. Stats Row
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: hPadding,
                      vertical: 16,
                    ),
                    child: const Row(
                      children: [
                        StatCard(
                          icon: Icons.history,
                          value: '12',
                          label: 'MY DONATIONS',
                          tinted: true,
                        ),
                        SizedBox(width: 16),
                        StatCard(
                          icon: Icons.bar_chart,
                          value: '4.8L',
                          label: 'TOTAL SAVED',
                        ),
                      ],
                    ),
                  ),
                ),

                // 5. Emergency Requests Header
                SliverToBoxAdapter(
                  child: SectionHeader(
                    hPadding: hPadding,
                    title: 'Emergency Requests',
                    actionLabel: 'View All',
                    onAction: () {},
                  ),
                ),

                // 6. Emergency Requests — Horizontal Scroll
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 180,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: hPadding),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        UrgentBloodCard(
                          bloodType: 'O+',
                          hospitalName: 'City Hospital',
                          distance: '2.4 km away',
                          timeRemaining: '2h',
                        ),
                        SizedBox(width: 16),
                        UrgentBloodCard(
                          bloodType: 'A-',
                          hospitalName: 'Metro Health',
                          distance: '5.1 km away',
                          timeRemaining: '4h',
                        ),
                      ],
                    ),
                  ),
                ),

                // 7. Nearby Requests Header
                SliverToBoxAdapter(
                  child: SectionHeader(
                    hPadding: hPadding,
                    title: 'Nearby Requests',
                  ),
                ),

                // 8. Nearby Requests — Vertical List
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const NearbyRequestTile(
                        bloodType: 'B+',
                        clinicName: "St. Mary's Clinic",
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
                  child: HomeMapSnippet(
                    hPadding: hPadding,
                    locationLabel: 'New York',
                    centersNearby: 3,
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            );
          },
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.cardColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.textSecondaryColor,
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
