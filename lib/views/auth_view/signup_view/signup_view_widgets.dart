// --- REUSABLE WIDGETS ---

import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 32),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppFonts.bodyMedium(
                color: isSelected
                    ? AppColors.textPrimaryColor
                    : AppColors.textSecondaryColor,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFonts.bodyLarge(weight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppFonts.bodyMedium(color: Colors.grey.shade400),
            filled: true,
            fillColor: AppColors.cardColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropdownField extends StatefulWidget {
  final String label;
  final String hint;
  final Function(String) onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  // List of blood types
  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: AppFonts.bodyLarge(weight: FontWeight.w500)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          hint: Text(
            widget.hint,
            style: AppFonts.bodyMedium(color: Colors.grey.shade400),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textSecondaryColor,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          ),
          // Styling the actual dropdown menu
          dropdownColor: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
          items: bloodTypes.map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type, style: AppFonts.bodyLarge()),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
              widget.onChanged(newValue!);
            });
          },
          // Optional: Add validation
          validator: (value) =>
              value == null ? 'Please select a blood type' : null,
        ),
      ],
    );
  }
}
