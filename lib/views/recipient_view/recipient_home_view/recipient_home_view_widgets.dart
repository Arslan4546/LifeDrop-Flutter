// --- Sub-Widgets ---

import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search for blood donors",
            hintStyle: AppFonts.bodyMedium(color: AppColors.textSecondaryColor),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.textSecondaryColor,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
      ),
    );
  }
}

class UrgentBanner extends StatelessWidget {
  const UrgentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Icon(
                Icons.emergency,
                color: Colors.white.withOpacity(0.15),
                size: 120,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Need blood urgently?",
                  style: AppFonts.bodyLarge(
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Create a public request and find\ndonors nearby instantly.",
                  style: AppFonts.bodySmall(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_circle,
                    size: 18,
                    color: AppColors.primaryColor,
                  ),
                  label: const Text("Create Blood Request"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primaryColor,
                    elevation: 0,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    textStyle: AppFonts.bodySmall(weight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BloodGroupFilter extends StatelessWidget {
  final List<String> groups;
  final String selected;
  final Function(String) onSelect;

  const BloodGroupFilter({
    super.key,
    required this.groups,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final isSelected = selected == groups[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () => onSelect(groups[index]),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Colors.transparent
                        : AppColors.borderColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  groups[index],
                  style: AppFonts.bodyLarge(
                    color: isSelected
                        ? Colors.white
                        : AppColors.textPrimaryColor,
                    weight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  final String name, distance, bloodGroup, donations, image;
  final bool isOnline;

  const DonorCard({
    super.key,
    required this.name,
    required this.distance,
    required this.bloodGroup,
    required this.donations,
    required this.image,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(image)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: isOnline ? AppColors.successColor : Colors.grey[300],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: AppFonts.bodyLarge(weight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        bloodGroup,
                        style: AppFonts.bodySmall(
                          color: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.textSecondaryColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  donations.toUpperCase(),
                  style: AppFonts.bodySmall(
                    color: isOnline
                        ? AppColors.textSecondaryColor
                        : AppColors.textSecondaryColor.withOpacity(0.6),
                    weight: FontWeight.bold,
                  ).copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(
              isOnline ? Icons.call : Icons.chat_bubble_outline,
              size: 20,
            ),
            style: IconButton.styleFrom(
              backgroundColor: isOnline
                  ? AppColors.primaryColor.withOpacity(0.1)
                  : AppColors.borderColor,
              foregroundColor: isOnline
                  ? AppColors.primaryColor
                  : AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, "Home", true),
            _navItem(Icons.list_alt, "Requests", false),
            const SizedBox(width: 40), // Space for FAB
            _navItem(Icons.group, "Donors", false),
            _navItem(Icons.person, "Profile", false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive
              ? AppColors.primaryColor
              : AppColors.textSecondaryColor,
        ),
        Text(
          label,
          style: AppFonts.bodySmall(
            color: isActive
                ? AppColors.primaryColor
                : AppColors.textSecondaryColor,
            weight: isActive ? FontWeight.bold : FontWeight.normal,
          ).copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
