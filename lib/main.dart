import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/routes/route_names.dart';

void main() {
  runApp(const LifeDropApp());
}

class LifeDropApp extends StatelessWidget {
  const LifeDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LifeDrop',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteNames.splashScreen,
    );
  }
}
