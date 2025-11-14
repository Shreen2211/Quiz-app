import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/presentation/view/widgets/quiz_list.dart';

import '../../view_model/providers/question_providers.dart';
import 'async_value_widget.dart';
import 'custom_header_text.dart';

class QuizSection extends ConsumerWidget {

  const QuizSection({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    final levelsAsync = ref.watch(levelsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: 'Quiz Category'),
        AsyncValueWidget(
          value: categoriesAsync,
          builder: (category) => SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (context, index) => QuizList(quizName: category[index], isLevel: false),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomHeaderText(text: 'Quiz Level'),
        AsyncValueWidget(
          value: levelsAsync,
          builder: (level) => SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: level.length,
              itemBuilder: (context, index) => QuizList(quizName: level[index], isLevel: true),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ],
    );
  }
}
