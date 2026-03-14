import 'package:flutter/material.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/views/donor_view/donor_home_view/home_screen.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_screen.dart';
import 'package:life_drop/views/splash_view/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.onboardingScreens:
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

      case RouteNames.homeScreen:
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

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
