import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_search_view/donor_search_view_widgets.dart';

class DonorSearchView extends StatefulWidget {
  const DonorSearchView({super.key});

  @override
  State<DonorSearchView> createState() => _DonorSearchViewState();
}

class _DonorSearchViewState extends State<DonorSearchView> {
  String _selectedBloodGroup = 'All';

  static const List<String> _bloodGroups = [
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
      backgroundColor: AppColors.backgroundColor,
      appBar: const DonorSearchAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Search bar
            const DonorSearchBar(),
            const SizedBox(height: 20),

            // Blood group filter chips
            BloodGroupFilterChips(
              groups: _bloodGroups,
              selected: _selectedBloodGroup,
              onSelected: (g) => setState(() => _selectedBloodGroup = g),
            ),
            const SizedBox(height: 25),

            // Nearby Hospitals section
            const SearchSectionHeader(title: 'Nearby Hospitals'),
            const SizedBox(height: 15),

            HospitalCard(
              name: 'City General Hospital',
              distance: '1.5 km away',
              bloodTag: 'Needs O-',
              icon: Icons.local_hospital,
            ),
            HospitalCard(
              name: 'Red Cross Center',
              distance: '3.2 km away',
              bloodTag: 'Needs AB+',
              icon: Icons.bloodtype,
            ),
            HospitalCard(
              name: 'St. Mary Medical Center',
              distance: '4.8 km away',
              bloodTag: 'Needs B-',
              icon: Icons.medical_services,
            ),

            const SizedBox(height: 25),

            // Map section
            const SearchSectionHeader(title: 'Location Map'),
            const SizedBox(height: 15),

            const SearchMapPreview(locationLabel: 'New York City, NY'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
