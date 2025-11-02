import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/app_images/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(); // عشان اتحكم فى الصفحات
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFE6B00), // بنفسجي
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: PageView(
          controller: _controller, // اربطيه هنا
          onPageChanged: (index) {
            setState(() {
              currentPage = index; // عشان تعرفي انتي ف أنهي صفحة
            });
          },
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 25,
                children: [
                  Image.asset(AppImages.onboardingOne, width: 300),
                  Text('Test your knowledge in every field'),
                  Text(
                    'Enjoy a huge collection of quiz questions in sports, movies, history, technology, and more — find out how much you really know!',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        // ✅ هنا التحرك البرمجي
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 25,
                children: [
                  Image.asset(AppImages.onboardingOne, width: 300),
                  Text('Test your knowledge in every field'),
                  Text(
                    'Enjoy a huge collection of quiz questions in sports, movies, history, technology, and more — find out how much you really know!',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        // ✅ هنا التحرك البرمجي
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 25,
                children: [
                  Image.asset(AppImages.onboardingOne, width: 300),
                  Text('Test your knowledge in every field'),
                  Text(
                    'Enjoy a huge collection of quiz questions in sports, movies, history, technology, and more — find out how much you really know!',
                  ),
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Get Start'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
