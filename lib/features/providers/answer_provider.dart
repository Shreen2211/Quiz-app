import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../data/models/answer_model.dart';

class AnswerNotifier extends StateNotifier<AnswerState> {
  AnswerNotifier() : super(AnswerState());

  void answerQuestion(bool isAnswerCorrect) {
    if (isAnswerCorrect) {
      state = state.copyWith(
        score: state.score + 1,
        isCorrect: true,
        color: Colors.green,
      );
    } else {
      state = state.copyWith(
        isCorrect: false,
        color: Colors.red,
      );
    }
  }
}
// Provider
final answerProvider = StateNotifierProvider<AnswerNotifier, AnswerState>(
      (ref) => AnswerNotifier(),
);
