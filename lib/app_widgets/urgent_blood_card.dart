import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class UrgentBloodCard extends StatelessWidget {
  const UrgentBloodCard({
    super.key,
    required this.bloodType,
    required this.hospitalName,
    required this.distance,
    required this.timeRemaining,
  });

  final String bloodType;
  final String hospitalName;
  final String distance;
  final String timeRemaining;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.15),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: blood type circle + hospital info + URGENT badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blood type circle
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    bloodType,
                    style: AppFonts.headingSmall(
                      color: AppColors.primaryColor,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Hospital details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospitalName,
                      style: AppFonts.bodyMedium(
                        color: AppColors.textPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      distance,
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              // URGENT badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'URGENT',
                  style: AppFonts.bodySmall(
                    color: AppColors.cardColor,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Bottom row: timer + donate button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expiry time
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: AppColors.textSecondaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Expires in $timeRemaining',
                    style: AppFonts.bodySmall(
                      color: AppColors.textSecondaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // Donate button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.cardColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Donate Now',
                  style: AppFonts.bodySmall(weight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
