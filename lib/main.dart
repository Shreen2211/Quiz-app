import 'package:flutter/material.dart';
import 'package:quiz_app/features/data/data_sources/local/AppPrefs.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/presentation/view/Screens/home/home_screen.dart';
import 'features/presentation/view/Screens/onboarding/onboarding_screen.dart';
import 'features/presentation/view/Screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs.init();
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/onboarding': (context) => OnboardingScreen(),
          '/home':(context) => HomeScreen(),
        },
      ),
    ),
  );
}
