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
