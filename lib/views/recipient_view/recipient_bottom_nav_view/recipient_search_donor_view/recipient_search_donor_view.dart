import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_search_donor_view/recipient_search_donor_view_widgets.dart';

class RecipientSearchDonorView extends StatefulWidget {
  const RecipientSearchDonorView({super.key});

  @override
  State<RecipientSearchDonorView> createState() =>
      _RecipientSearchDonorViewState();
}

class _RecipientSearchDonorViewState extends State<RecipientSearchDonorView> {
  String selectedBloodGroup = "All";
  final List<String> bloodGroups = ["All", "A+", "O-", "B+", "AB+"];

  @override
  Widget build(BuildContext context) {
    // Media Query for Responsive Design
    final size = MediaQuery.of(context).size;
    final hPadding = size.width * 0.05; // 5% horizontal padding

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.textPrimaryColor,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Text(
          "Find Donors",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.tune,
                  color: AppColors.textPrimaryColor,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Search Bar & Filter Section
          Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
            color: AppColors.backgroundColor,
            child: Column(
              children: [
                const SearchField(),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: bloodGroups.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return BloodGroupChip(
                        label: bloodGroups[index],
                        isSelected: selectedBloodGroup == bloodGroups[index],
                        onTap: () => setState(
                          () => selectedBloodGroup = bloodGroups[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // 2. Donor List Section
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NEARBY DONORS",
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                        weight: FontWeight.bold,
                      ).copyWith(letterSpacing: 1.1),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "24 Active",
                        style: AppFonts.bodySmall(
                          color: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const DonorCard(
                  name: "Sarah Jenkins",
                  bloodType: "O- Negative",
                  distance: "0.8 km away",
                  lastDonated: "4 months ago",
                  imageUrl: "https://i.pravatar.cc/150?u=sarah",
                ),
                const DonorCard(
                  name: "Marcus Thorne",
                  bloodType: "A+ Positive",
                  distance: "1.2 km away",
                  lastDonated: "2 weeks ago",
                  imageUrl: "https://i.pravatar.cc/150?u=marcus",
                ),
                const DonorCard(
                  name: "Elena Rodriguez",
                  bloodType: "B+ Positive",
                  distance: "2.5 km away",
                  lastDonated: "1 year ago",
                  imageUrl: "https://i.pravatar.cc/150?u=elena",
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        elevation: 6,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
