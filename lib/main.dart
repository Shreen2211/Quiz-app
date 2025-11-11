import 'package:flutter/material.dart';
import 'package:quiz_app/features/presentation/view/splash/splash_screen.dart';

import 'features/data/data_sources/question_local_data_source.dart';
import 'features/presentation/view/home/home_screen.dart';
import 'features/presentation/view/onboarding/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataSource = QuestionLocalDataSource();
  final levels = await dataSource.getAllLevels();
  print("Levels from DataSource: $levels");
  print("First Level: ${levels.first}");
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
