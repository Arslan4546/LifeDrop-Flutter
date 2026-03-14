import 'package:flutter/material.dart';

import 'package:life_drop/views/splash_view/splash_screen.dart';

void main() {
  runApp(const LifeDropApp());
}

class LifeDropApp extends StatelessWidget {
  const LifeDropApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LifeDrop Splash',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 16, 9, 9),
      ),
      home: const SplashScreen(),
      // const SplashScreen(),
    );
  }
}
