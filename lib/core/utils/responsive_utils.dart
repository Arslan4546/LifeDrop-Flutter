import 'package:flutter/material.dart';

/// Responsive breakpoint definitions following Material Design 3 guidelines
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

/// Device type enumeration
enum DeviceType { mobile, tablet, desktop }

/// Responsive utility class for breakpoint-based layouts
class ResponsiveUtils {
  /// Get device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= Breakpoints.desktop) return DeviceType.desktop;
    if (width >= Breakpoints.tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  /// Check if current device is mobile
  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  /// Check if current device is tablet
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  /// Check if current device is desktop
  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  /// Get responsive value based on device type
  static T getResponsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.mobile:
        return mobile;
    }
  }

  /// Get responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    return getResponsiveValue(
      context: context,
      mobile: const EdgeInsets.all(16),
      tablet: const EdgeInsets.all(24),
      desktop: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
    );
  }

  /// Get responsive font scale factor (prevents excessive scaling)
  static double getFontScale(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    // Clamp text scale to prevent overflow issues
    return textScale.clamp(0.8, 1.2);
  }
}
