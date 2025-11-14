import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/color/color_const.dart';

import '../../widgets/daily_task_card.dart';
import '../../widgets/quiz_section.dart';
import '../../widgets/user_header.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            children: [UserHeader(), DailyTaskCard(), QuizSection()],
          ),
        ),
      ),
    );
  }
}
