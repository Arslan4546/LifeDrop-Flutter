import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  /// HEADING LARGE
  static TextStyle headingLarge({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontSize: size ?? 28,
      fontWeight: weight ?? FontWeight.w700,
      letterSpacing: letterSpacing ?? 0,
      height: height ?? 1.3,
      color: color,
    );
  }

  /// HEADING MEDIUM
  static TextStyle headingMedium({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  /// HEADING SMALL
  static TextStyle headingSmall({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
  }) {
    return GoogleFonts.poppins(
      fontSize: size ?? 18,
      fontWeight: weight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? 0,
      color: color,
    );
  }

  /// BODY LARGE
  static TextStyle bodyLarge({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: size ?? 16,
      fontWeight: weight ?? FontWeight.w500,
      letterSpacing: letterSpacing ?? 0,
      color: color,
      height: height,
    );
  }

  /// BODY MEDIUM
  static TextStyle bodyMedium({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: size ?? 14,
      fontWeight: weight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      color: color,
      height: height,
    );
  }

  /// BODY SMALL
  static TextStyle bodySmall({
    double? size,
    FontWeight? weight,
    double? letterSpacing,
    Color? color,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: size ?? 12,
      fontWeight: weight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0,
      color: color,
      height: height,
    );
  }
}
