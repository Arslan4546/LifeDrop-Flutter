import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_widgets.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/widgets/responsive_layout_builder.dart';
import '../../../data/models/blood_request_model.dart';
import 'widgets/availability_card.dart';
import 'widgets/map_preview_card.dart';
import 'widgets/nearby_request_tile.dart';
import 'widgets/responsive_emergency_section.dart';
import 'widgets/responsive_greeting_section.dart';
import 'widgets/responsive_stats_row.dart';

/// Fully responsive Donor Dashboard Page
/// Uses LayoutBuilder throughout for adaptive layouts
class DonorDashboardPageResponsive extends StatefulWidget {
  const DonorDashboardPageResponsive({super.key});

  @override
  State<DonorDashboardPageResponsive> createState() =>
      _DonorDashboardPageResponsiveState();
}

class _DonorDashboardPageResponsiveState
    extends State<DonorDashboardPageResponsive> {
  bool _isAvailable = true;

  // Mock data
  final List<BloodRequestModel> _emergencyRequests = [
    BloodRequestModel(
      id: '1',
      hospitalName: 'City Hospital',
      bloodType: 'O+',
      distance: 2.4,
      expiryTime: DateTime.now().add(const Duration(hours: 2)),
      isUrgent: true,
    ),
    BloodRequestModel(
      id: '2',
      hospitalName: 'General Medical Center',
      bloodType: 'A-',
      distance: 3.8,
      expiryTime: DateTime.now().add(const Duration(hours: 4)),
      isUrgent: true,
    ),
  ];

  final List<BloodRequestModel> _nearbyRequests = [
    BloodRequestModel(
      id: '3',
      hospitalName: "St. Mary's Clinic",
      bloodType: 'B+',
      distance: 1.2,
      scheduledTime: DateTime.now().add(const Duration(days: 1)),
    ),
    BloodRequestModel(
      id: '4',
      hospitalName: 'Hope Medical Center',
      bloodType: 'AB-',
      distance: 2.5,
      scheduledTime: DateTime.now().add(const Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ResponsiveLayoutBuilder(
          mobile: (context) => _buildMobileLayout(),
          tablet: (context) => _buildTabletLayout(),
          desktop: (context) => _buildDesktopLayout(),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildMobileLayout() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildAppBar()),
        SliverPadding(
          padding: ResponsiveUtils.getResponsivePadding(context),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              ResponsiveGreetingSection(
                userName: 'Jane',
                avatarUrl: 'https://i.pravatar.cc/150?img=5',
              ),
              const SizedBox(height: 20),
              AvailabilityCard(
                isAvailable: _isAvailable,
                onAvailabilityChanged: (value) =>
                    setState(() => _isAvailable = value),
              ),
              const SizedBox(height: 20),
              ResponsiveStatsRow(donationsCount: '12', totalSaved: '4.8L'),
              const SizedBox(height: 24),
              ResponsiveEmergencySection(requests: _emergencyRequests),
              const SizedBox(height: 24),
              _buildNearbyRequestsSection(),
              const SizedBox(height: 20),
              MapPreviewCard(centerCount: 3),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        // Left sidebar for navigation (common in tablet layouts)
        NavigationRail(
          selectedIndex: 0,
          onDestinationSelected: (index) {},
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text(AppStrings.navHome),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.search),
              label: Text(AppStrings.navSearch),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.favorite),
              label: Text(AppStrings.navRequests),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.notifications),
              label: Text(AppStrings.navAlerts),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person),
              label: Text(AppStrings.navProfile),
            ),
          ],
        ),
        // Main content
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _buildAppBar()),
              SliverPadding(
                padding: ResponsiveUtils.getResponsivePadding(context),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    ResponsiveGreetingSection(
                      userName: 'Jane',
                      avatarUrl: 'https://i.pravatar.cc/150?img=5',
                    ),
                    const SizedBox(height: 24),
                    // Two-column layout for tablet
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              AvailabilityCard(
                                isAvailable: _isAvailable,
                                onAvailabilityChanged: (value) =>
                                    setState(() => _isAvailable = value),
                              ),
                              const SizedBox(height: 20),
                              ResponsiveStatsRow(
                                donationsCount: '12',
                                totalSaved: '4.8L',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 3,
                          child: MapPreviewCard(centerCount: 3),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ResponsiveEmergencySection(requests: _emergencyRequests),
                    const SizedBox(height: 24),
                    _buildNearbyRequestsSection(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Permanent drawer for desktop
        Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.water_drop, color: Colors.white, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      AppStrings.appName,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(AppStrings.navHome),
                selected: true,
              ),
              const ListTile(
                leading: Icon(Icons.search),
                title: Text(AppStrings.navSearch),
              ),
              const ListTile(
                leading: Icon(Icons.favorite),
                title: Text(AppStrings.navRequests),
              ),
              const ListTile(
                leading: Icon(Icons.notifications),
                title: Text(AppStrings.navAlerts),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text(AppStrings.navProfile),
              ),
            ],
          ),
        ),
        // Main content with max width constraint
        Expanded(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: ResponsiveUtils.getResponsivePadding(context),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Desktop: Header with stats in row
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ResponsiveGreetingSection(
                                    userName: 'Jane',
                                    avatarUrl:
                                        'https://i.pravatar.cc/150?img=5',
                                  ),
                                  const SizedBox(height: 20),
                                  AvailabilityCard(
                                    isAvailable: _isAvailable,
                                    onAvailabilityChanged: (value) =>
                                        setState(() => _isAvailable = value),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            SizedBox(
                              width: 400,
                              child: ResponsiveStatsRow(
                                donationsCount: '12',
                                totalSaved: '4.8L',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Three-column layout for desktop
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  ResponsiveEmergencySection(
                                    requests: _emergencyRequests,
                                  ),
                                  const SizedBox(height: 24),
                                  _buildNearbyRequestsSection(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            Expanded(child: MapPreviewCard(centerCount: 3)),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.water_drop, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          const Text(
            AppStrings.appName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: AppColors.textPrimary,
          ),
        ],
      ),
    );
  }

  Widget _buildNearbyRequestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: AppStrings.nearbyRequests),
        const SizedBox(height: 12),
        ..._nearbyRequests.map(
          (request) => NearbyRequestTile(request: request, onTap: () {}),
        ),
      ],
    );
  }

  Widget? _buildBottomNav() {
    // Hide bottom nav on tablet/desktop (using side navigation instead)
    if (ResponsiveUtils.isTablet(context) ||
        ResponsiveUtils.isDesktop(context)) {
      return null;
    }
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppStrings.navHome,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppStrings.navSearch,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: AppStrings.navRequests,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: AppStrings.navAlerts,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppStrings.navProfile,
        ),
      ],
    );
  }
}
