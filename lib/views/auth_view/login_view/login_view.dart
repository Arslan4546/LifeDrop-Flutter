import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

import 'package:life_drop/views/auth_view/login_view/login_view_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 24.0 : size.width * 0.2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Logo Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.water_drop,
                    color: AppColors.primaryColor,
                    size: 32,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "LifeDrop",
                    style: AppFonts.headingMedium(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "Welcome Back",
                style: AppFonts.headingLarge(color: AppColors.textPrimaryColor),
              ),
              const SizedBox(height: 8),
              Text(
                "Login to your account to save lives",
                style: AppFonts.bodyMedium(color: AppColors.textSecondaryColor),
              ),

              const SizedBox(height: 30),

              // Banner Image Placeholder
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: const Center(
                  child: Icon(Icons.biotech, size: 80, color: Colors.white),
                  // Replace Icon with Image.asset('assets/login_banner.png')
                ),
              ),

              const SizedBox(height: 30),

              // Form Fields
              _buildInputLabel("Email Address"),
              CustomTextField(
                controller: _emailController,
                hintText: "name@example.com",
                prefixIcon: Icons.email_outlined,
              ),

              const SizedBox(height: 20),

              _buildInputLabel("Password"),
              CustomTextField(
                controller: _passwordController,
                hintText: "Enter your password",
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                obscureText: !_isPasswordVisible,
                onSuffixTap: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: AppFonts.bodyMedium(
                      color: AppColors.primaryColor,
                    ).copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              PrimaryButton(text: "Login", onPressed: () {}),

              const SizedBox(height: 30),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider(color: AppColors.borderColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR LOGIN WITH",
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppColors.borderColor)),
                ],
              ),

              const SizedBox(height: 30),

              // Social Buttons
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      label: "Google",
                      iconPath: Icons.g_mobiledata,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(label: "Apple", iconPath: Icons.apple),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppFonts.bodyMedium(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign Up",
                      style: AppFonts.bodyMedium(
                        color: AppColors.primaryColor,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
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

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 4),
        child: Text(
          label,
          style: AppFonts.bodyLarge(color: AppColors.textPrimaryColor),
        ),
      ),
    );
  }
}
