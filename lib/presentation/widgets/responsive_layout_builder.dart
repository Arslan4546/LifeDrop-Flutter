import 'package:flutter/material.dart';
import 'package:life_drop/core/utils/responsive_utils.dart';
import '../utils/responsive_utils.dart';

/// Responsive layout builder widget
/// Rebuilds child when screen size crosses breakpoints
class ResponsiveLayoutBuilder extends StatelessWidget {
  /// Builder for mobile layout (required)
  final WidgetBuilder mobile;

  /// Builder for tablet layout (optional, falls back to mobile)
  final WidgetBuilder? tablet;

  /// Builder for desktop layout (optional, falls back to tablet then mobile)
  final WidgetBuilder? desktop;

  const ResponsiveLayoutBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = _getDeviceType(constraints.maxWidth);

        switch (deviceType) {
          case DeviceType.desktop:
            return desktop?.call(context) ??
                tablet?.call(context) ??
                mobile(context);
          case DeviceType.tablet:
            return tablet?.call(context) ?? mobile(context);
          case DeviceType.mobile:
            return mobile(context);
        }
      },
    );
  }

  DeviceType _getDeviceType(double width) {
    if (width >= Breakpoints.desktop) return DeviceType.desktop;
    if (width >= Breakpoints.tablet) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}

/// Responsive container that adjusts constraints based on screen size
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;
  final Alignment alignment;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveMaxWidth =
            maxWidth ??
            ResponsiveUtils.getResponsiveValue(
              context: context,
              mobile: double.infinity,
              tablet: 700,
              desktop: 1200,
            );

        return Align(
          alignment: alignment,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
            child: child,
          ),
        );
      },
    );
  }
}
