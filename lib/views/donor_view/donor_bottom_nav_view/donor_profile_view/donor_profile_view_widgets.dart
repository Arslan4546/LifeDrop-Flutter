import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop",
                ), // Placeholder
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "John Doe",
          style: AppFonts.headingMedium(color: AppColors.textPrimaryColor),
        ),
        Text(
          "Verified Donor",
          style: AppFonts.bodyMedium(
            color: AppColors.primaryColor,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isRed;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.isRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppFonts.bodySmall(
              color: AppColors.textSecondaryColor,
            ).copyWith(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppFonts.headingSmall(
              color: isRed
                  ? AppColors.primaryColor
                  : AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class AvailabilityCard extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const AvailabilityCard({
    super.key,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available to Donate",
                  style: AppFonts.bodyLarge(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Your status is visible to emergency seekers",
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: isEnabled,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class DonationHistoryHeader extends StatelessWidget {
  const DonationHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Donation History",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
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
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String hospital;
  final String subtitle;
  final IconData icon;

  const HistoryTile({
    super.key,
    required this.hospital,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            child: Icon(icon, color: AppColors.primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospital,
                  style: AppFonts.bodyLarge(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.successColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "COMPLETED",
              style: AppFonts.bodySmall(
                color: AppColors.successColor,
              ).copyWith(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.textSecondaryColor),
      title: Text(
        title,
        style: AppFonts.bodyLarge(color: AppColors.textPrimaryColor),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.borderColor),
      onTap: () {},
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.logout, size: 18),
      label: const Text("Logout"),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(color: AppColors.borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: AppFonts.bodyLarge(weight: FontWeight.bold),
      ),
    );
  }
}
