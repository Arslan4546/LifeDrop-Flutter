import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Provided Theme Classes ---

class AppColors {
  static const primaryColor = Color(0xFFE53935);
  static const primaryDarkColor = Color(0xFFC62828);
  static const backgroundColor = Color(0xFFF7F8FA);
  static const cardColor = Color(0xFFFFFFFF);
  static const textPrimaryColor = Color(0xFF1C1C1E);
  static const textSecondaryColor = Color(0xFF6B7280);
  static const borderColor = Color(0xFFE5E7EB);
  static const successColor = Color(0xFF22C55E);
  static const dangerColor = Color(0xFFEF4444);
}

class AppFonts {
  static TextStyle headingLarge({Color? color}) => GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: color,
  );

  static TextStyle headingMedium({Color? color}) => GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle headingSmall({Color? color}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle bodyLarge({Color? color, FontWeight? weight}) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: weight ?? FontWeight.w500,
        color: color,
      );

  static TextStyle bodyMedium({Color? color, FontWeight? weight}) =>
      GoogleFonts.inter(
        fontSize: 14,
        fontWeight: weight ?? FontWeight.w400,
        color: color,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

// --- Main View ---

class DonorProfileView extends StatefulWidget {
  const DonorProfileView({super.key});

  @override
  State<DonorProfileView> createState() => _DonorProfileViewState();
}

class _DonorProfileViewState extends State<DonorProfileView> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
        title: Text(
          "My Profile",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor.withOpacity(0.1),
              child: const Icon(
                Icons.settings,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. Profile Image & Name
              const _ProfileHeader(),
              const SizedBox(height: 24),

              // 2. Stats Section
              Row(
                children: const [
                  Expanded(
                    child: _StatCard(
                      label: "BLOOD GROUP",
                      value: "O+",
                      isRed: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(label: "DONATIONS", value: "12"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(label: "LIVES SAVED", value: "4.8L"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Availability Toggle
              _AvailabilityCard(
                isEnabled: isAvailable,
                onChanged: (val) => setState(() => isAvailable = val),
              ),
              const SizedBox(height: 24),

              // 4. Donation History
              const _DonationHistoryHeader(),
              const SizedBox(height: 12),
              const _HistoryTile(
                hospital: "City General Hospital",
                subtitle: "2 units • Oct 12, 2023",
                icon: Icons.local_hospital,
              ),
              const SizedBox(height: 12),
              const _HistoryTile(
                hospital: "Red Cross Center",
                subtitle: "1 unit • July 05, 2023",
                icon: Icons.bloodtype,
              ),
              const SizedBox(height: 32),

              // 5. Settings Menu
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SETTINGS",
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ).copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                ),
              ),
              const SizedBox(height: 12),
              const _SettingsTile(
                icon: Icons.person_outline,
                title: "Account Details",
              ),
              const _SettingsTile(
                icon: Icons.lock_outline,
                title: "Privacy & Security",
              ),
              const _SettingsTile(
                icon: Icons.help_outline,
                title: "Help & Support",
              ),

              const SizedBox(height: 24),

              // 6. Logout Button
              _LogoutButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

// --- Sub-Widgets ---

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/300',
                ), // Placeholder
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.verified,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "John Doe",
          style: AppFonts.headingMedium(color: AppColors.textPrimaryColor),
        ),
        Text(
          "Verified Donor",
          style: AppFonts.bodyMedium(
            color: AppColors.primaryColor,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isRed;

  const _StatCard({
    required this.label,
    required this.value,
    this.isRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppFonts.bodySmall(
              color: AppColors.textSecondaryColor,
            ).copyWith(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppFonts.headingSmall(
              color: isRed
                  ? AppColors.primaryColor
                  : AppColors.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _AvailabilityCard extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const _AvailabilityCard({required this.isEnabled, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor, width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available to Donate",
                  style: AppFonts.bodyLarge(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Your status is visible to emergency seekers",
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: isEnabled,
            activeColor: AppColors.primaryColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _DonationHistoryHeader extends StatelessWidget {
  const _DonationHistoryHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Donation History",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "View All",
            style: AppFonts.bodyMedium(
              color: AppColors.primaryColor,
              weight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final String hospital;
  final String subtitle;
  final IconData icon;

  const _HistoryTile({
    required this.hospital,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.1),
            child: Icon(icon, color: AppColors.primaryColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospital,
                  style: AppFonts.bodyLarge(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.successColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "COMPLETED",
              style: AppFonts.bodySmall(
                color: AppColors.successColor,
              ).copyWith(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SettingsTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.textSecondaryColor),
      title: Text(
        title,
        style: AppFonts.bodyLarge(color: AppColors.textPrimaryColor),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.borderColor),
      onTap: () {},
    );
  }
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.logout, size: 18),
      label: const Text("Logout"),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(color: AppColors.borderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: AppFonts.bodyLarge(weight: FontWeight.bold),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.textSecondaryColor,
      currentIndex: 3,
      selectedLabelStyle: AppFonts.bodySmall().copyWith(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: AppFonts.bodySmall(),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Requests",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: "Map",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
