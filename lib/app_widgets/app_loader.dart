import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final bool showText;
  final String text;

  const AppLoader({
    super.key,
    this.size = 60,
    this.strokeWidth = 4,
    this.showText = false,
    this.text = "Loading...",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            width: size,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cardColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              backgroundColor: AppColors.borderColor,
            ),
          ),

          if (showText) ...[
            const SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(
                color: AppColors.textSecondaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
