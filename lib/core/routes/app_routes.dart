import 'package:flutter/material.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:life_drop/views/home_view/home_screen.dart';
import 'package:life_drop/views/on_boarding_view/on_boarding_screen.dart';
import 'package:life_drop/views/splash_view/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => SplashScreen(),

    RouteNames.onboardingScreens: (context) => OnboardingScreen(),

    // RouteNames.loginScreen: (context) => LoginScreen(),

    // RouteNames.signupScreen: (context) => SignupScreen(),
    RouteNames.homeScreen: (context) => HomeScreen(),

    // RouteNames.findDonorsScreen: (context) => FindDonorsScreen(),

    // RouteNames.createRequestScreen: (context) => CreateRequestScreen(),

    // RouteNames.requestsScreen: (context) => RequestsScreen(),

    // RouteNames.profileScreen: (context) => ProfileScreen(),
  };
}
