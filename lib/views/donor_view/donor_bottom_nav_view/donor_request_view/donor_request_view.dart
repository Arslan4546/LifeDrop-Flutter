import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_request_view/donor_request_view_widgets.dart';

class DonorRequestView extends StatelessWidget {
  const DonorRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // Custom App Bar
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.blueGrey),
        title: Text(
          "Requests",
          style: GoogleFonts.inter(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.blueGrey),
              onPressed: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: RequestTabBar(
            tabs: const ["Urgent", "Nearby", "Scheduled"],
            activeIndex: 0,
            onTabSelected: (index) {},
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RequestCard(
            hospitalName: "City General Hospital",
            bloodGroup: "O+ Group",
            distance: "2.5 km away",
            expiry: "Expires in 3h",
            imageUrl:
                "https://images.unsplash.com/photo-1587350859728-117622bc4a7e?q=80&w=1000",
          ),
          RequestCard(
            hospitalName: "St. Jude Medical Center",
            bloodGroup: "A- Group",
            distance: "4.1 km away",
            expiry: "Expires in 5h",
            imageUrl:
                "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=1000",
          ),
          RequestCard(
            hospitalName: "North Star Clinic",
            bloodGroup: "B+ Group",
            distance: "1.2 km away",
            expiry: "Expires in 1h",
            imageUrl:
                "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=1000",
          ),
          const SizedBox(height: 80), // Space for Bottom Nav
        ],
      ),
    );
  }
}
