import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UrgentBloodCard extends StatelessWidget {
  final String bloodType;
  final String hospitalName;
  final String distance;
  final String timeRemaining;

  const UrgentBloodCard({
    super.key,
    required this.bloodType,
    required this.hospitalName,
    required this.distance,
    required this.timeRemaining,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = const Color(0xFFE53935);
    final Color textDark = const Color(0xFF131A2A);
    final Color textSubtitle = const Color(0xFF5A6B80);

    return Container(
      width: 280, // Fixed width for horizontal scroll
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: primaryRed.withOpacity(0.15),
          width: 2, // Slight red border as per design
        ),
        boxShadow: [
          BoxShadow(
            color: primaryRed.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Blood Type & Hospital Details & URGENT Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Blood Type Circle
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAE9E9), // Light red bg
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    bloodType,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primaryRed,
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
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textDark,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      distance,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: textSubtitle,
                      ),
                    ),
                  ],
                ),
              ),
              
              // URGENT badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF05151), // Slightly different red
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'URGENT',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          
          const Spacer(), // Pushes bottom row down

          // Bottom Row: Timer & Donate Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Time Left
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled, // Filled clock
                    color: const Color(0xFF718298), // Greyish blue
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Expires in $timeRemaining',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF718298),
                    ),
                  ),
                ],
              ),
              
              // Donate Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryRed,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Donate Now',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
