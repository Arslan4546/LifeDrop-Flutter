import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyRequestTile extends StatelessWidget {
  final String bloodType;
  final String clinicName;
  final String scheduleTime;

  const NearbyRequestTile({
    super.key,
    required this.bloodType,
    required this.clinicName,
    required this.scheduleTime,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = const Color(0xFFE53935);
    final Color textDark = const Color(0xFF131A2A);
    final Color textSubtitle = const Color(0xFF5A6B80);

    return Container(
      margin: const EdgeInsets.only(bottom: 12), // Spacing between list items
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: primaryRed.withOpacity(0.05), // Very subtle border
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Blood Type Circle Container
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFF7F8F9), // Very light grey bg
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                bloodType,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: primaryRed, // Red text for blood type
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
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: textDark,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Scheduled: $scheduleTime',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: textSubtitle,
                  ),
                ),
              ],
            ),
          ),
          
          // Right Arrow Icon
          Icon(
            Icons.chevron_right, // iOS style right chevron
            color: const Color(0xFF8699B0), // Grey icon
            size: 24,
          ),
        ],
      ),
    );
  }
}
