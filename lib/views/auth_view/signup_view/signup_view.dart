import 'package:flutter/material.dart';

import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String selectedRole = 'Donor'; // State for role selection

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColors.textPrimaryColor,
        ),
        title: Text("Sign Up", style: AppFonts.headingSmall()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Logo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.water_drop,
                  color: AppColors.primaryColor,
                  size: 40,
                ),
              ),
              const SizedBox(height: 24),
              Text("Join LifeDrop", style: AppFonts.headingLarge()),
              Text("Start saving lives today", style: AppFonts.bodyMedium()),

              const SizedBox(height: 32),

              // Role Selection Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select your role",
                  style: AppFonts.bodyLarge(weight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: RoleCard(
                      title: "I am a Donor",
                      icon: Icons.volunteer_activism,
                      isSelected: selectedRole == 'Donor',
                      onTap: () => setState(() => selectedRole = 'Donor'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RoleCard(
                      title: "I am a Recipient",
                      icon: Icons.medical_services,
                      isSelected: selectedRole == 'Recipient',
                      onTap: () => setState(() => selectedRole = 'Recipient'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Form Fields
              const CustomTextField(label: "Full Name", hint: "Jane Doe"),
              const SizedBox(height: 20),
              const CustomTextField(
                label: "Email Address",
                hint: "jane@example.com",
              ),
              const SizedBox(height: 20),
              const CustomDropdownField(
                label: "Blood Type",
                hint: "Select your blood type",
              ),

              const SizedBox(height: 40),

              // Action Button
              PrimaryButton(text: "Create Account", onPressed: () {}),

              const SizedBox(height: 24),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppFonts.bodyMedium(),
                  ),
                  Text(
                    "Log In",
                    style: AppFonts.bodyMedium(
                      color: AppColors.primaryColor,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// --- REUSABLE WIDGETS ---

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

  const CustomTextField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppFonts.bodyLarge(weight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
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

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hint,
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
