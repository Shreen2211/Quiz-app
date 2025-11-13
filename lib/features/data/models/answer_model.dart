import 'package:flutter/material.dart';

class AnswerState {
  final int score;
  final bool isCorrect;
  final bool showNextButton;
  final Color color;

  AnswerState({
    this.score = 0,
    this.isCorrect = false,
    this.showNextButton = false,
    this.color = Colors.white,
  });

  AnswerState copyWith({
    int? score,
    bool? isCorrect,
    bool? showNextButton,
    Color? color,
  }) {
    return AnswerState(
      score: score ?? this.score,
      isCorrect: isCorrect ?? this.isCorrect,
      showNextButton: showNextButton ?? this.showNextButton,
      color: color ?? this.color,
    );
  }
}
