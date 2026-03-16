import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';

// ─────────────────────────────────────────────────────────────────────────────
// APP BAR
// ─────────────────────────────────────────────────────────────────────────────

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.hPadding});
  final double hPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Brand logo + name
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.water_drop, color: Colors.white, size: 18),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'LifeDrop',
                style: AppFonts.headingSmall(
                  color: AppColors.textPrimaryColor,
                  weight: FontWeight.w700,
                ),
              ),
            ],
          ),

          // Search icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.borderColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.search, color: AppColors.textPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PROFILE HEADER
// ─────────────────────────────────────────────────────────────────────────────

class HomeProfileHeader extends StatelessWidget {
  const HomeProfileHeader({
    super.key,
    required this.hPadding,
    required this.name,
    required this.subtitle,
    required this.avatarUrl,
  });

  final double hPadding;
  final String name;
  final String subtitle;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 16),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              image: DecorationImage(
                image: NetworkImage(avatarUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $name!',
                style: AppFonts.headingMedium(
                  color: AppColors.textPrimaryColor,
                  weight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                subtitle,
                style: AppFonts.bodyMedium(color: AppColors.textSecondaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DONATION AVAILABILITY CARD
// ─────────────────────────────────────────────────────────────────────────────

class DonationAvailabilityCard extends StatelessWidget {
  const DonationAvailabilityCard({
    super.key,
    required this.hPadding,
    this.isAvailable = true,
  });

  final double hPadding;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available to Donate',
                    style: AppFonts.bodyLarge(
                      color: AppColors.textPrimaryColor,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Receive urgent blood requests nearby',
                    style: AppFonts.bodySmall(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            // Toggle pill
            Container(
              width: 58,
              height: 32,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isAvailable
                    ? AppColors.primaryColor
                    : AppColors.borderColor,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: isAvailable
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.cardColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// STAT CARD
// ─────────────────────────────────────────────────────────────────────────────

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.tinted = false,
  });

  final IconData icon;
  final String value;
  final String label;
  final bool tinted; // light-red tint vs plain white

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: tinted
              ? AppColors.primaryColor.withOpacity(0.08)
              : AppColors.cardColor,
          borderRadius: BorderRadius.circular(24),
          border: tinted
              ? Border.all(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  width: 1,
                )
              : null,
          boxShadow: tinted
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 24),
            const SizedBox(height: 12),
            Text(
              value,
              style: AppFonts.headingLarge(
                color: AppColors.textPrimaryColor,
                weight: FontWeight.w700,
                size: 28,
              ),
            ),
            Text(
              label,
              style: AppFonts.bodySmall(
                color: AppColors.textSecondaryColor,
                weight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// SECTION HEADER
// ─────────────────────────────────────────────────────────────────────────────

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.hPadding,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  final double hPadding;
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.headingSmall(
              color: AppColors.textPrimaryColor,
              weight: FontWeight.w700,
            ),
          ),
          if (actionLabel != null)
            TextButton(
              onPressed: onAction,
              child: Text(
                actionLabel!,
                style: AppFonts.bodyMedium(
                  color: AppColors.primaryColor,
                  weight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// MAP SNIPPET
// ─────────────────────────────────────────────────────────────────────────────

class HomeMapSnippet extends StatelessWidget {
  const HomeMapSnippet({
    super.key,
    required this.hPadding,
    required this.locationLabel,
    required this.centersNearby,
  });

  final double hPadding;
  final String locationLabel;
  final int centersNearby;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 24),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
            image: NetworkImage(
              'https://www.google.com/maps/about/images/treks/map_hero.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white54, BlendMode.lighten),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pin + location label
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                  size: 36,
                ),
                Text(
                  locationLabel,
                  style: AppFonts.bodyMedium(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            // "N Centers Near You" badge
            Positioned(
              bottom: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  '$centersNearby Centers Near You',
                  style: AppFonts.bodyMedium(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Nearby request widget

class NearbyRequestTile extends StatelessWidget {
  const NearbyRequestTile({
    super.key,
    required this.bloodType,
    required this.clinicName,
    required this.scheduleTime,
  });

  final String bloodType;
  final String clinicName;
  final String scheduleTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.05),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Blood type circle
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                bloodType,
                style: AppFonts.bodyMedium(
                  color: AppColors.primaryColor,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Clinic details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  clinicName,
                  style: AppFonts.bodyMedium(
                    color: AppColors.textPrimaryColor,
                    weight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Scheduled: $scheduleTime',
                  style: AppFonts.bodySmall(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Right chevron
          const Icon(
            Icons.chevron_right,
            color: AppColors.textSecondaryColor,
            size: 24,
          ),
        ],
      ),
    );
  }
}

// Urget Blood Card

class UrgentBloodCard extends StatelessWidget {
  const UrgentBloodCard({
    super.key,
    required this.bloodType,
    required this.hospitalName,
    required this.distance,
    required this.timeRemaining,
  });

  final String bloodType;
  final String hospitalName;
  final String distance;
  final String timeRemaining;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.15),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: blood type circle + hospital info + URGENT badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blood type circle
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    bloodType,
                    style: AppFonts.headingSmall(
                      color: AppColors.primaryColor,
                      weight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Hospital details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospitalName,
                      style: AppFonts.bodyMedium(
                        color: AppColors.textPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      distance,
                      style: AppFonts.bodySmall(
                        color: AppColors.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              // URGENT badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'URGENT',
                  style: AppFonts.bodySmall(
                    color: AppColors.cardColor,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),

          const Spacer(),

          // Bottom row: timer + donate button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Expiry time
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: AppColors.textSecondaryColor,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Expires in $timeRemaining',
                    style: AppFonts.bodySmall(
                      color: AppColors.textSecondaryColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              // Donate button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.cardColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Donate Now',
                  style: AppFonts.bodySmall(weight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
