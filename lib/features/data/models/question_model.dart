class Question {
  final int id;
  final String question;
  final List<String> answers;
  final String correctAnswer; // بدل int خليها String
  final String category;
  final String level;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.category,
    required this.level,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] ?? 0,
      category: json['category'] ?? '',
      level: json['level'] ?? '',
      question: json['question'] ?? '',
      answers: List<String>.from(json['answers'] ?? []),
      correctAnswer: json['current_answer'] ?? '', // مهم جداً
    );
  }

}
