import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/core/utils/flush_bar.dart';
import 'package:life_drop/data/models/user_model/user_model.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_bloc.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_event.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_state.dart';
import 'package:life_drop/views/auth_view/signup_view/signup_view_widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedRole = 'Donor';
  String selectedBloodType = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          FlushbarHelper.showSuccess(
            context: context,
            message: "Account created successfully 🎉",
          );

          // Navigation
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(
              context,
              state.user.role == "Donor"
                  ? RouteNames.donorBottomNavView
                  : RouteNames.recipientBottomNavView,
            );
          });
        } else if (state is AuthError) {
          FlushbarHelper.showError(context: context, message: state.message);
        }
      },
      child: Scaffold(
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
                CustomTextField(
                  label: "Full Name",
                  hint: "Jane Doe",
                  controller: nameController,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Email Address",
                  hint: "jane@example.com",
                  controller: emailController,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Password",
                  hint: "Enter your password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Confirm Password",
                  hint: "Enter your password",
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                CustomDropdownField(
                  label: "Blood Type",
                  hint: "Select your blood type",
                  onChanged: (value) {
                    setState(() {
                      selectedBloodType = value;
                    });
                  },
                ),

                const SizedBox(height: 40),

                // Action Button
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return PrimaryButton(
                      text: "Create Account",
                      onPressed: () {
                        if (nameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            confirmPasswordController.text.isEmpty ||
                            selectedBloodType.isEmpty) {
                          FlushbarHelper.showError(
                            context: context,
                            message: "Please fill all the fields",
                          );
                          return;
                        }
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          FlushbarHelper.showError(
                            context: context,
                            message: "Passwords do not match",
                          );
                          return;
                        }
                        context.read<AuthBloc>().add(
                          RegisterEvent(
                            UserModel(
                              uid: '',
                              name: nameController.text,
                              email: emailController.text,
                              role: selectedRole,
                              bloodType: selectedBloodType,
                            ),
                            passwordController.text,
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: AppFonts.bodyMedium(),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.loginView);
                      },
                      child: Text(
                        "Log In",
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
      ),
    );
  }
}
