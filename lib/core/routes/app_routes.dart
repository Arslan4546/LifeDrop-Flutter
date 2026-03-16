import 'package:flutter/material.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_alert_view/donor_alert_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_request_view/donor_request_view.dart';
import 'package:life_drop/views/donor_view/donor_bottom_nav_view/donor_search_view/donor_search_view.dart';
import 'package:life_drop/views/donor_view/donor_home_view/donor_home_screen.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_screen.dart';
import 'package:life_drop/views/splash_view/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashView:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

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

      case RouteNames.donorHomeView:
        return PageRouteBuilder(
          pageBuilder: (ctx, anim, secAnim) => const HomeScreen(),
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
        return MaterialPageRoute(builder: (_) => const DonorRequestView());
      case RouteNames.donorAlertView:
        return MaterialPageRoute(builder: (_) => const DonorAlertView());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
