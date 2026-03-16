import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Professional App Colors ---
class AppColors {
  static const primaryColor = Color(0xFFE53935);
  static const primaryDarkColor = Color(0xFFC62828);
  static const backgroundColor = Color(0xFFF7F8FA);
  static const cardColor = Color(0xFFFFFFFF);
  static const textPrimaryColor = Color(0xFF1C1C1E);
  static const textSecondaryColor = Color(0xFF6B7280);
  static const borderColor = Color(0xFFE5E7EB);
  static const successColor = Color(0xFF22C55E);
  static const dangerColor = Color(0xFFEF4444);
}

// --- Professional App Fonts ---
class AppFonts {
  static TextStyle headingSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? AppColors.textPrimaryColor,
  );

  static TextStyle bodyMedium({Color? color, FontWeight? weight}) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? AppColors.textSecondaryColor,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? AppColors.textSecondaryColor,
  );
}

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
      body: ListView(
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
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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

  Widget _buildBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: AppColors.borderColor, width: 0.5),
        ),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, "Home", false),
          _navItem(Icons.map_outlined, "Map", false),
          _navItem(Icons.notifications, "Alerts", true),
          _navItem(Icons.person_outline, "Profile", false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive
              ? AppColors.primaryColor
              : AppColors.textSecondaryColor,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style:
              AppFonts.bodySmall(
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.textSecondaryColor,
              ).copyWith(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ],
    );
  }
}

// --- Reusable Alert Card Component ---
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
