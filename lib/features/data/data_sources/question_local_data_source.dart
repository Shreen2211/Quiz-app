import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/question_model.dart';

class QuestionLocalDataSource {
  Future<List<Question>> getQuestions() async {
    // قراءة ملف الـ JSON
    final String response = await rootBundle.loadString('assets/data/questions.json');

    // تحويل الـ JSON إلى List
    final List<dynamic> data = json.decode(response);

    // debug print
    print("Decoded JSON data: $data");

    // تحويل كل عنصر في الـ List إلى Question
    final questions = data.map((json) => Question.fromJson(json)).toList();

    return questions;
  }
/*
  Future<List<Question>> getQuestions() async {
    final String response = await rootBundle.loadString('assets/data/questions.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Question.fromJson(json)).toList();
  }*/

  // جلب الأسئلة حسب Level و Category
  Future<List<Question>> getQuestionsByLevel(String level) async {
    final allQuestions = await getQuestions();
    final levelQuestions =
    allQuestions.where((q) => q.level == level).toList();

    print("Questions for level '$level': ${levelQuestions.length}");
    return levelQuestions;
  }
  Future<List<Question>> getQuestionsByCategory(String category) async {
    final allQuestions = await getQuestions();
    final categoryQuestions =
    allQuestions.where((q) => q.category == category).toSet().toList();
    print("Questions for category '$category': ${categoryQuestions.length}");
    for (var q in categoryQuestions) {
      print('Question: ${q.question}, Level: ${q.level}, Category: ${q.category}');
    }

    return categoryQuestions;
  }

  // جلب كل Levels المتاحة
  Future<List<String>> getAllLevels() async {
    final allQuestions = await getQuestions();
    final levels = allQuestions.map((q) => q.level).toSet().toList();
    print("All Levels: $levels"); // هيتطبع في الكونسول
    if (levels.isNotEmpty) {
      print("First Level: ${levels.first}"); // تأكدي من Level الأول
    }
    return levels;
  }


  // جلب كل Categories المتاحة
  Future<List<String>> getAllCategories() async {
    final allQuestions = await getQuestions();
    final categories = allQuestions.map((q) => q.category).toSet().toList();
    print("All Categories: $categories"); // هيتطبع في الكونسول
    if (categories.isNotEmpty) {
      print("First Category: ${categories.first}"); // تأكدي من الكاتيجوري الأول
    }
    return categories;
  }

}
