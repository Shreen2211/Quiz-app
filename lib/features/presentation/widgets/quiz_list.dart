import 'package:flutter/material.dart';
import '../view/quiz/quiz_screen.dart';

class QuizList extends StatelessWidget {
 final String quizName;
 final bool isLevel;
  const QuizList({super.key,required this.quizName,required this.isLevel});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      isLevel: isLevel,
                      quiz:quizName,
                    ),
                  ),
                );
              },
              child: Text(quizName),
            ),
          ],
        );
  }
}
