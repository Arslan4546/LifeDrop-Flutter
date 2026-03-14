import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonorSearchView extends StatefulWidget {
  const DonorSearchView({super.key});

  @override
  State<DonorSearchView> createState() => __DonorSearchViewState();
}

class __DonorSearchViewState extends State<DonorSearchView> {
  // Colors from your HTML
  final Color primaryColor = const Color(0xFFE53734);
  final Color bgColorLight = const Color(0xFFF8F6F6);
  final Color cardColor = Colors.white;

  String selectedBloodGroup = 'All';
  final List<String> bloodGroups = [
    'All',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorLight,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildFilterChips(),
            const SizedBox(height: 25),
            _buildSectionHeader("Nearby Hospitals"),
            const SizedBox(height: 15),
            _buildHospitalCard(
              "City General Hospital",
              "1.5 km away",
              "Needs O-",
              Icons.local_hospital,
            ),
            _buildHospitalCard(
              "Red Cross Center",
              "3.2 km away",
              "Needs AB+",
              Icons.bloodtype,
            ),
            _buildHospitalCard(
              "St. Mary Medical Center",
              "4.8 km away",
              "Needs B-",
              Icons.medical_services,
            ),
            const SizedBox(height: 25),
            _buildSectionHeader("Location Map"),
            const SizedBox(height: 15),
            _buildMapPreview(),
            const SizedBox(height: 100), // Space for bottom nav
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- UI Components ---

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: bgColorLight,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {},
      ),
      title: Text(
        "Search",
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_outlined, color: primaryColor),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search for blood group or hospital",
        hintStyle: GoogleFonts.inter(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: primaryColor),
        filled: true,
        fillColor: primaryColor.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: bloodGroups.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          bool isSelected = selectedBloodGroup == bloodGroups[index];
          return GestureDetector(
            onTap: () =>
                setState(() => selectedBloodGroup = bloodGroups[index]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor
                    : primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryColor.withOpacity(0.2)),
              ),
              alignment: Alignment.center,
              child: Text(
                bloodGroups[index],
                style: GoogleFonts.inter(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          "See All",
          style: GoogleFonts.inter(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildHospitalCard(
    String name,
    String distance,
    String tag,
    IconData icon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: primaryColor),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Text(
                            distance,
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
                  tag,
                  style: GoogleFonts.inter(
                    color: primaryColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "View Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: Icon(Icons.directions, color: primaryColor),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1?q=80&w=1000",
          ), // Placeholder map
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.my_location, color: primaryColor, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    "New York City, NY",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, "Home", false),
            _navItem(Icons.search, "Search", true),
            const SizedBox(width: 40), // Space for FAB
            _navItem(Icons.water_drop_outlined, "Requests", false),
            _navItem(Icons.person_outline, "Profile", false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? primaryColor : Colors.grey),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 10,
            color: isActive ? primaryColor : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
