import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final IconData icon;
  final bool isUrgent;
  final bool isCompleted;
  const AlertCard({
    super.key,
    required this.title,
    required this.location,
    required this.time,
    required this.icon,
    this.isUrgent = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isCompleted ? 0.7 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: isUrgent
              ? AppColors.primaryColor.withOpacity(0.05)
              : AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: isUrgent
              ? const Border(
                  left: BorderSide(color: AppColors.primaryColor, width: 4),
                )
              : Border.all(color: AppColors.borderColor.withOpacity(0.5)),
          boxShadow: [
            if (!isUrgent)
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: isUrgent
                    ? AppColors.primaryColor
                    : isCompleted
                    ? AppColors.borderColor
                    : AppColors.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isUrgent || isCompleted
                    ? Colors.white
                    : AppColors.primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppFonts.bodyMedium(
                            weight: FontWeight.bold,
                            color: AppColors.textPrimaryColor,
                          ),
                        ),
                      ),
                      if (isUrgent)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "URGENT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(location, style: AppFonts.bodyMedium()),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.textSecondaryColor,
                      ),
                      const SizedBox(width: 4),
                      Text(time, style: AppFonts.bodySmall()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AllAlertsList extends StatelessWidget {
  const AllAlertsList({super.key});

  @override
  Widget build(BuildContext context) {
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
}

class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final String subMessage;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.message,
    required this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
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
}

class AlertsTabSelector extends StatelessWidget {
  final int activeIndex;
  final Function(int) onTabSelected;

  const AlertsTabSelector({
    super.key,
    required this.activeIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ["All", "Unread", "Nearby"];

    return Row(
      children: List.generate(tabs.length, (index) {
        bool isActive = activeIndex == index;

        return Expanded(
          child: GestureDetector(
            onTap: () => onTabSelected(index),
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

class AlertsTabContent extends StatelessWidget {
  final int activeTabIndex;

  const AlertsTabContent({super.key, required this.activeTabIndex});

  @override
  Widget build(BuildContext context) {
    switch (activeTabIndex) {
      case 0:
        return const AllAlertsList();

      case 1:
        return const EmptyStateWidget(
          icon: Icons.mark_email_read_outlined,
          message: "You're all caught up!",
          subMessage: "No unread alerts at the moment.",
        );

      case 2:
        return const EmptyStateWidget(
          icon: Icons.location_off_outlined,
          message: "No Nearby Requests",
          subMessage:
              "There are no blood donation requests in your immediate area right now.",
        );

      default:
        return const SizedBox();
    }
  }
}
