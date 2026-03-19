import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class ProfileHeaderSection extends StatelessWidget {
  final String name;
  final String status;
  final String imageUrl;

  const ProfileHeaderSection({
    super.key,
    required this.name,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.verified, color: Colors.white, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: AppFonts.headingMedium(color: AppColors.textPrimaryColor),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            status.toUpperCase(),
            style: AppFonts.bodySmall(
              color: AppColors.primaryColor,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;

  const StatCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
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
            style: AppFonts.bodySmall(
              color: AppColors.textSecondaryColor,
              weight: FontWeight.bold,
            ).copyWith(fontSize: 10, letterSpacing: 0.5),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppFonts.headingSmall(
              color: AppColors.primaryColor,
              weight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class RequestHistoryCard extends StatelessWidget {
  final String hospitalName;
  final String details;
  final String status;
  final Color statusColor;

  const RequestHistoryCard({
    super.key,
    required this.hospitalName,
    required this.details,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.local_hospital,
              color: AppColors.primaryColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospitalName,
                  style: AppFonts.bodyLarge(weight: FontWeight.bold),
                ),
                Text(
                  details,
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
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: AppFonts.bodySmall(
                color: statusColor,
                weight: FontWeight.bold,
              ).copyWith(fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
