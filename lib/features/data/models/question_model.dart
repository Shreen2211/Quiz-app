class Question {
  final int id;
  final String question;
  final List<String> answers;
  final int correctAnswer;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answers: List<String>.from(json['answers']),
      correctAnswer: json['correctAnswer'],
    );
  }
}
