import 'package:flutter/material.dart';

import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/auth_view/signup_view/signup_view_widgets.dart';

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

