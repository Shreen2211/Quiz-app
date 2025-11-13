import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class QuestionLocalDataSource {
  Future<List<Question>> getQuestions() async {
    // قراءة ملف الـ JSON
    final String response = await rootBundle.loadString('assets/data/questions.json');

    // تحويل الـ JSON إلى List
    final List<dynamic> data = json.decode(response);

    // تحويل كل عنصر في الـ List إلى Question
    final questions = data.map((json) => Question.fromJson(json)).toList();

    return questions;
  }

  // جلب الأسئلة حسب Level و Category
  Future<List<Question>> getQuestionsByLevel(String level) async {
    final allQuestions = await getQuestions();
    final levelQuestions =
    allQuestions.where((q) => q.level == level).toList();
    return levelQuestions;
  }

  Future<List<Question>> getQuestionsByCategory(String category) async {
    final allQuestions = await getQuestions();
    final categoryQuestions =
    allQuestions.where((q) => q.category == category).toSet().toList();
    return categoryQuestions;
  }

  // جلب كل Levels المتاحة
  Future<List<String>> getAllLevels() async {
    final allQuestions = await getQuestions();
    final levels = allQuestions.map((q) => q.level).toSet().toList();
    return levels;
  }


  // جلب كل Categories المتاحة
  Future<List<String>> getAllCategories() async {
    final allQuestions = await getQuestions();
    final categories = allQuestions.map((q) => q.category).toSet().toList();
    return categories;
  }

}
