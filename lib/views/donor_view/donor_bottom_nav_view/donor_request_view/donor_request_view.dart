import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorRequestView extends StatelessWidget {
  const DonorRequestView({super.key});

  final Color primaryColor = const Color(0xFFE53734);
  final Color bgColor = const Color(0xFFF8F6F6);
  final Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // Custom App Bar
      appBar: AppBar(
        backgroundColor: bgColor,
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
          child: _buildTabBar(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildRequestCard(
            context,
            hospitalName: "City General Hospital",
            bloodGroup: "O+ Group",
            distance: "2.5 km away",
            expiry: "Expires in 3h",
            imageUrl:
                "https://images.unsplash.com/photo-1587350859728-117622bc4a7e?q=80&w=1000",
          ),
          _buildRequestCard(
            context,
            hospitalName: "St. Jude Medical Center",
            bloodGroup: "A- Group",
            distance: "4.1 km away",
            expiry: "Expires in 5h",
            imageUrl:
                "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=1000",
          ),
          _buildRequestCard(
            context,
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
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- 1. Custom Tab Bar ---
  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: primaryColor.withOpacity(0.1)),
        ),
      ),
      child: Row(
        children: [
          _tabItem("Urgent", isActive: true),
          _tabItem("Nearby", isActive: false),
          _tabItem("Scheduled", isActive: false),
        ],
      ),
    );
  }

  Widget _tabItem(String title, {required bool isActive}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? primaryColor : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: isActive ? primaryColor : Colors.grey[500],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // --- 2. Reusable Request Card (Fully Responsive) ---
  Widget _buildRequestCard(
    BuildContext context, {
    required String hospitalName,
    required String bloodGroup,
    required String distance,
    required String expiry,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Section with Aspect Ratio
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Blood Group Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        hospitalName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        bloodGroup,
                        style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Info and Donate Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Distance and Expiry
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _iconInfo(Icons.location_on, distance, Colors.grey),
                          const SizedBox(height: 4),
                          _iconInfo(Icons.schedule, expiry, primaryColor),
                        ],
                      ),
                    ),
                    // Donate Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                        shadowColor: primaryColor.withOpacity(0.4),
                      ),
                      child: Text(
                        "Donate",
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for small icon + text info
  Widget _iconInfo(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              color: color,
              fontSize: 13,
              fontWeight: color == primaryColor
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  // --- 3. Bottom Navigation Bar ---
  Widget _buildBottomNav() {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(top: BorderSide(color: primaryColor.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home_outlined, "Home", false),
          _navItem(Icons.water_drop, "Requests", true),
          _navItem(Icons.map_outlined, "Map", false),
          _navItem(Icons.person_outline, "Profile", false),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? primaryColor : Colors.grey[400]),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? primaryColor : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
