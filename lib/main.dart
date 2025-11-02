import 'package:flutter/material.dart';
import 'package:quiz_app/features/presentation/view/splash/splash_screen.dart';

import 'features/presentation/view/home/home_screen.dart';
import 'features/presentation/view/onboarding/onboarding_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home':(context) => HomeScreen(),
      },
    ),
  );
}
