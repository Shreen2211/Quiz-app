import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/question_model.dart';

class QuestionLocalDataSource {
  Future<List<Question>> getQuestions() async {
    final String response = await rootBundle.loadString(
      'assets/data/questions.json',
    );
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Question.fromJson(json)).toList();
  }
}
