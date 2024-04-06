class WeightLossQuestion {
  final int id;
  final String question;
  final List<String> options;

  WeightLossQuestion({
    required this.id,
    required this.question,
    required this.options,
  });

  factory WeightLossQuestion.fromJson(Map<String, dynamic> json) {
    return WeightLossQuestion(
      id: json['id'] ?? 0,
      question: json['question'] ?? '',
      options: List<String>.from(json['options'] ?? []),
    );
  }
}
