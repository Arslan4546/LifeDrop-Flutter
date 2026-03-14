import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class NearbyRequestTile extends StatelessWidget {
  const NearbyRequestTile({
    super.key,
    required this.bloodType,
    required this.clinicName,
    required this.scheduleTime,
  });

  final String bloodType;
  final String clinicName;
  final String scheduleTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Blood type circle
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                bloodType,
                style: AppFonts.bodyMedium(
                  color: AppColors.primaryColor,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Clinic details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  clinicName,
                  style: AppFonts.bodyMedium(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Scheduled: $scheduleTime',
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Right chevron
          const Icon(
            Icons.chevron_right,
            color: AppColors.textSecondaryColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}
