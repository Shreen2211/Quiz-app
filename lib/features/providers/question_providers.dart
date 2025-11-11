import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../data/data_sources/question_local_data_source.dart';
import '../data/models/question_model.dart';


/// Provider للـ Data Source
final questionLocalDataSourceProvider = Provider<QuestionLocalDataSource>((ref) {
  return QuestionLocalDataSource();
});

final currentQuestionIndexProvider = StateProvider<int>((ref) => 0);
final selectedAnswerIndexProvider = StateProvider<int?>((ref) => null);

/// FutureProvider لكل Levels المتاحة
final levelsProvider = FutureProvider<List<String>>((ref) async {
  final dataSource = ref.read(questionLocalDataSourceProvider);
  return dataSource.getAllLevels();
});

/// FutureProvider لكل Categories المتاحة
final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final dataSource = ref.read(questionLocalDataSourceProvider);
  return dataSource.getAllCategories();
});


/// ✅ Provider خاص بالـ Level
final questionsByLevelProvider = FutureProvider.family<List<Question>, String>((ref, level) async {
  final dataSource = ref.read(questionLocalDataSourceProvider);
  return dataSource.getQuestionsByLevel(level);
});

/// ✅ Provider خاص بالـ Category
final questionsByCategoryProvider = FutureProvider.family<List<Question>, String>((ref, category) async {
  final dataSource = ref.read(questionLocalDataSourceProvider);
  return dataSource.getQuestionsByCategory(category);
});
