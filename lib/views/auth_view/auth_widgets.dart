import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: AppColors.primaryColor.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppFonts.bodyLarge(
                color: Colors.white,
                weight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }
}
