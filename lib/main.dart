import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';

import 'package:life_drop/views/splash_view/splash_screen.dart';

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
      home: const SplashScreen(),
    );
  }
}
