import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_profile_view/recipient_profile_view_widgets.dart';

class RecipientProfileView extends StatelessWidget {
  const RecipientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double hPadding = size.width * 0.05;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryColor),
          onPressed: () {},
        ),
        title: Text(
          "Profile",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.textPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 1. Profile Header
            const ProfileHeaderSection(
              name: "Jane Doe",
              status: "Verified Recipient",
              imageUrl: "https://i.pravatar.cc/300?u=jane",
            ),

            const SizedBox(height: 32),

            // 2. Statistics Grid
            const Row(
              children: [
                Expanded(
                  child: StatCard(label: "BLOOD GROUP", value: "O+"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(label: "ACTIVE", value: "2"),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatCard(label: "FULFILLED", value: "5"),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // 3. Request History Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Request History",
                  style: AppFonts.headingSmall(
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: AppFonts.bodyMedium(
                      color: AppColors.primaryColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const RequestHistoryCard(
              hospitalName: "City General Hospital",
              details: "2 units • Oct 12, 2023",
              status: "COMPLETED",
              statusColor: AppColors.textSecondaryColor,
            ),
            const SizedBox(height: 12),
            const RequestHistoryCard(
              hospitalName: "North Star Clinic",
              details: "1 unit • July 05, 2023",
              status: "FULFILLED",
              statusColor: AppColors.successColor,
            ),

            const SizedBox(height: 32),

            // 4. Settings Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SETTINGS",
                style: AppFonts.bodySmall(
                  color: AppColors.textSecondaryColor,
                  weight: FontWeight.bold,
                ).copyWith(letterSpacing: 1.2),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.borderColor.withOpacity(0.5),
                ),
              ),
              child: const Column(
                children: [
                  SettingsItem(
                    icon: Icons.person_outline,
                    title: "Account Details",
                  ),
                  Divider(height: 1, indent: 50),
                  SettingsItem(
                    icon: Icons.shield_outlined,
                    title: "Privacy & Security",
                  ),
                  Divider(height: 1, indent: 50),
                  SettingsItem(
                    icon: Icons.help_outline,
                    title: "Help & Support",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 5. Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(
                    color: AppColors.borderColor,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: AppFonts.bodyLarge(
                    color: AppColors.primaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Reusable Components (Non-Private) ---
