import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/app_images/app_images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/color/color_const.dart';
import 'package:quiz_app/features/presentation/widgets/async_value_widget.dart';
import 'package:quiz_app/features/presentation/widgets/custom_header_text.dart';

import '../../../providers/question_providers.dart';
import '../../widgets/quiz_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelsAsync = ref.watch(levelsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorConst.orangeBackground, ColorConst.blueBackground],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(AppImages.logo),
                      ),
                      SizedBox(width: 10),
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomHeaderText(text: 'Roxane Harley'),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Expert',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.bolt,
                          color: ColorConst.orangeBackground,
                          size: 22,
                        ),
                        Text(
                          '1200',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Color(0xFFB388FF), Color(0xFF8C9EFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomHeaderText(text: 'Daily Task'),
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.white.withValues(
                                    alpha: 0.3,
                                  ),
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '20 Questions',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            LinearProgressIndicator(
                              value:10 / 20,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(10),
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.2,
                              ),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orange,
                              ),
                            ),
                            Text(
                              'Progress  10/14',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomHeaderText(text: 'Quiz Category'),
              AsyncValueWidget(
                value: categoriesAsync,
                builder: (category) => SizedBox(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (context, index) =>
                        QuizList(quizName: category[index], isLevel: false),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              CustomHeaderText(text: 'Quiz Level'),
              AsyncValueWidget(
                value: levelsAsync,
                builder: (level) => SizedBox(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: level.length,
                    itemBuilder: (context, index) =>
                        QuizList(quizName: level[index], isLevel: true),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
