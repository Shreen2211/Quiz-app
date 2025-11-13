import 'package:flutter/material.dart';
import 'package:quiz_app/features/presentation/view/splash/splash_screen.dart';
import 'features/presentation/view/home/home_screen.dart';
import 'features/presentation/view/onboarding/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
