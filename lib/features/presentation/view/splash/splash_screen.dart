import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/app_images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // بنستخدم Future.delayed علشان ننتظر شوية (زي 3 ثواني)
    // وبعدها نروح للصفحة اللي بعدها
    Future.delayed(const Duration(seconds: 3), () {
      if(mounted){
       Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFE6B00), // بنفسجي
              Color(0xFF2575FC), // أزرق
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Image.asset(
              AppImages.logo,
                  ),
            Text('Quiz APP',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)
          ],
        ),
      )
    );
  }
}
