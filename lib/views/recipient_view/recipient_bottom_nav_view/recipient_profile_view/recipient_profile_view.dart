import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_profile_view/recipient_profile_view_widgets.dart';

class RecipientProfileView extends StatefulWidget {
  const RecipientProfileView({super.key});

  @override
  State<RecipientProfileView> createState() => _RecipientProfileViewState();
}

class _RecipientProfileViewState extends State<RecipientProfileView> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        title: Text(
          "My Profile",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor.withOpacity(0.1),
              child: const Icon(
                Icons.settings,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. Profile Image & Name
              const ProfileHeader(),
              const SizedBox(height: 24),

              // 2. Stats Section
              Row(
                children: const [
                  Expanded(
                    child: StatCard(
                      label: "BLOOD GROUP",
                      value: "O+",
                      isRed: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(label: "DONATIONS", value: "12"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatCard(label: "LIVES SAVED", value: "4.8L"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Availability Toggle
              AvailabilityCard(
                isEnabled: isAvailable,
                onChanged: (val) => setState(() => isAvailable = val),
              ),
              const SizedBox(height: 24),

              // 4. Donation History
              const DonationHistoryHeader(),
              const SizedBox(height: 12),
              const HistoryTile(
                hospital: "City General Hospital",
                subtitle: "2 units • Oct 12, 2023",
                icon: Icons.local_hospital,
              ),
              const SizedBox(height: 12),
              const HistoryTile(
                hospital: "Red Cross Center",
                subtitle: "1 unit • July 05, 2023",
                icon: Icons.bloodtype,
              ),
              const SizedBox(height: 32),

              // 5. Settings Menu
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SETTINGS",
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ).copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                ),
              ),
              const SizedBox(height: 12),
              const SettingsTile(
                icon: Icons.person_outline,
                title: "Account Details",
              ),
              const SettingsTile(
                icon: Icons.lock_outline,
                title: "Privacy & Security",
              ),
              const SettingsTile(
                icon: Icons.help_outline,
                title: "Help & Support",
              ),

              const SizedBox(height: 24),

              // 6. Logout Button
              LogoutButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
