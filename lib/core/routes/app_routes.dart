import 'package:flutter/material.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_alert_view/donor_alert_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_bottom_nav.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_profile_view/donor_profile_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_request_view/donor_request_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_search_view/donor_search_view.dart';
import 'package:life_drop/views/donor_view/donor_home_view/donor_home_view.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_screen.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_donor_view/recipient_donor_view.dart';
import 'package:life_drop/views/recipient_view/recipient_home_view/recipient_home_view.dart';
import 'package:life_drop/views/splash_view/splash_view.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash Screen
      case RouteNames.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RouteNames.onboardingView:
        return PageRouteBuilder(
          pageBuilder: (ctx, anim, secAnim) => const OnboardingScreen(),
          transitionsBuilder: (ctx, animation, secAnim, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      // Donor Screens
      case RouteNames.donorBottomNavView:
        return PageRouteBuilder(
          pageBuilder: (ctx, anim, secAnim) => DonorBottomNavView(),
          transitionsBuilder: (ctx, animation, secAnim, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      case RouteNames.donorHomeView:
        return PageRouteBuilder(
          pageBuilder: (ctx, anim, secAnim) => DonorHomeView(),
          transitionsBuilder: (ctx, animation, secAnim, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      case RouteNames.donorSearchView:
        return MaterialPageRoute(builder: (_) => const DonorSearchView());
      case RouteNames.donorRequestView:
        return MaterialPageRoute(builder: (_) => DonorRequestView());
      case RouteNames.donorAlertView:
        return MaterialPageRoute(builder: (_) => const DonorAlertView());
      case RouteNames.donorProfileView:
        return MaterialPageRoute(builder: (_) => const DonorProfileView());
      // Recipient Screens
      // case RouteNames.recipientBottomNavView:
      //   return PageRouteBuilder(
      //     pageBuilder: (ctx, anim, secAnim) => RecipientBottomNavView(),
      //     transitionsBuilder: (ctx, animation, secAnim, child) {
      //       const begin = Offset(1.0, 0.0);
      //       const end = Offset.zero;

      //       final tween = Tween(begin: begin, end: end);

      //       return SlideTransition(
      //         position: animation.drive(tween),
      //         child: child,
      //       );
      //     },
      //     transitionDuration: const Duration(milliseconds: 600),
      //   );
      case RouteNames.recipientHomeView:
        return PageRouteBuilder(
          pageBuilder: (ctx, anim, secAnim) => RecipientHomeView(),
          transitionsBuilder: (ctx, animation, secAnim, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            final tween = Tween(begin: begin, end: end);

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 600),
        );
      // case RouteNames.recipientProfileView:
      //   return MaterialPageRoute(builder: (_) => const RecipientProfileView());
      // case RouteNames.recipientRequestView:
      //   return MaterialPageRoute(builder: (_) => RecipientRequestView());
      case RouteNames.recipientSearchDonorsView:
        return MaterialPageRoute(
          builder: (_) => const RecipientSearchDonorView(),
        );
      // case RouteNames.recipientSearchView:
      //   return MaterialPageRoute(builder: (_) => const RecipientSearchView());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
