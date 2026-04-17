import 'package:flutter/material.dart';
import 'package:life_drop/bloc_provider.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/routes/app_routes.dart';
import 'package:life_drop/core/routes/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const LifeDropApp());
}

class LifeDropApp extends StatelessWidget {
  const LifeDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LifeDrop',
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteNames.loginView,
      ),
    );
  }
}
