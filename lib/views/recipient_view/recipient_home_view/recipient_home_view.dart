import 'package:flutter/material.dart' hide SearchBar;
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/recipient_view/recipient_home_view/recipient_home_view_widgets.dart';

class RecipientHomeView extends StatefulWidget {
  const RecipientHomeView({super.key});

  @override
  State<RecipientHomeView> createState() => _RecipientHomeViewState();
}

class _RecipientHomeViewState extends State<RecipientHomeView> {
  String selectedGroup = "All";
  final List<String> bloodGroups = ["All", "A+", "A-", "B+", "B-", "O+", "O-"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.05;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            SearchBar(),
            const SizedBox(height: 24),
            UrgentBanner(),
            const SizedBox(height: 24),

            // Blood Group Selection
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "SELECT BLOOD GROUP",
                style: AppFonts.bodySmall(
                  color: AppColors.textSecondaryColor,
                  weight: FontWeight.bold,
                ).copyWith(letterSpacing: 1.1),
              ),
            ),
            const SizedBox(height: 12),
            BloodGroupFilter(
              groups: bloodGroups,
              selected: selectedGroup,
              onSelect: (val) => setState(() => selectedGroup = val),
            ),

            const SizedBox(height: 32),

            // Nearby Donors Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Donors",
                    style: AppFonts.headingSmall(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View on Map",
                      style: AppFonts.bodyMedium(
                        color: AppColors.primaryColor,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Donor List
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 8,
              ),
              children: const [
                DonorCard(
                  name: "James Anderson",
                  distance: "0.8 km away",
                  bloodGroup: "O+",
                  donations: "12 Donations",
                  isOnline: true,
                  image: "https://i.pravatar.cc/150?u=james",
                ),
                DonorCard(
                  name: "Elena Rodriguez",
                  distance: "1.2 km away",
                  bloodGroup: "A-",
                  donations: "5 Donations",
                  isOnline: true,
                  image: "https://i.pravatar.cc/150?u=elena",
                ),
                DonorCard(
                  name: "Michael Chen",
                  distance: "2.5 km away",
                  bloodGroup: "B+",
                  donations: "Last donated 2 weeks ago",
                  isOnline: false,
                  image: "https://i.pravatar.cc/150?u=michael",
                ),
              ],
            ),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: AppColors.primaryColor.withOpacity(0.1),
          child: const Icon(
            Icons.menu,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ),
      title: Text(
        "LifeDrop",
        style: AppFonts.headingMedium(color: AppColors.textPrimaryColor),
      ),
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.primaryColor,
                  size: 22,
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 18,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
