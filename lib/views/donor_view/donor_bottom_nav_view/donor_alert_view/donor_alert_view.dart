import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_alert_view/donor_alert_view_widgets.dart';

class DonorAlertView extends StatefulWidget {
  const DonorAlertView({super.key});

  @override
  State<DonorAlertView> createState() => _DonorAlertViewState();
}

class _DonorAlertViewState extends State<DonorAlertView> {
  int _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.textPrimaryColor,
        ),
        title: Text("Alerts", style: AppFonts.headingSmall()),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.textPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: _buildTabSelector(),
        ),
      ),
      // --- Dynamic Body based on active tab ---
      body: _buildSelectedTabContent(),
    );
  }

  // Logic to return the correct widget based on the active tab
  Widget _buildSelectedTabContent() {
    switch (_activeTabIndex) {
      case 0:
        return _buildAllAlertsList();
      case 1:
        return _buildEmptyState(
          icon: Icons.mark_email_read_outlined,
          message: "You're all caught up!",
          subMessage: "No unread alerts at the moment.",
        );
      case 2:
        return _buildEmptyState(
          icon: Icons.location_off_outlined,
          message: "No Nearby Requests",
          subMessage:
              "There are no blood donation requests in your immediate area right now.",
        );
      default:
        return const SizedBox();
    }
  }

  // Helper for the main Alert List
  Widget _buildAllAlertsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        AlertCard(
          title: "Emergency: O- Blood Needed",
          location: "St. Mary's General Hospital",
          time: "10 mins ago",
          icon: Icons.bloodtype,
          isUrgent: true,
        ),
        SizedBox(height: 12),
        AlertCard(
          title: "Platelet Request",
          location: "City Health Center",
          time: "25 mins ago",
          icon: Icons.medical_services_outlined,
          isUrgent: false,
        ),
        SizedBox(height: 12),
        AlertCard(
          title: "Critical: AB+ Plasma Needed",
          location: "Riverside Medical Center",
          time: "45 mins ago",
          icon: Icons.monitor_heart_outlined,
          isUrgent: true,
        ),
        SizedBox(height: 12),
        AlertCard(
          title: "Blood Type Screening Event",
          location: "Community Outreach Plaza",
          time: "2 hours ago",
          icon: Icons.vaccines_outlined,
          isUrgent: false,
        ),
        SizedBox(height: 12),
        AlertCard(
          title: "Donation Successfully Completed",
          location: "Thank you for saving a life!",
          time: "Yesterday",
          icon: Icons.check_circle_outline,
          isUrgent: false,
          isCompleted: true,
        ),
      ],
    );
  }

  // Reusable component for Empty States (Unread/Nearby)
  Widget _buildEmptyState({
    required IconData icon,
    required String message,
    required String subMessage,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 64,
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
            ),
            const SizedBox(height: 8),
            Text(
              subMessage,
              textAlign: TextAlign.center,
              style: AppFonts.bodyMedium(color: AppColors.textSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    final tabs = ["All", "Unread", "Nearby"];
    return Row(
      children: List.generate(tabs.length, (index) {
        bool isActive = _activeTabIndex == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _activeTabIndex = index),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isActive
                        ? AppColors.primaryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tabs[index],
                style: AppFonts.bodyMedium(
                  weight: isActive ? FontWeight.bold : FontWeight.w500,
                  color: isActive
                      ? AppColors.primaryColor
                      : AppColors.textSecondaryColor,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
