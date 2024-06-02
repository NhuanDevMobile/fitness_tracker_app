class WeightLossQuestion {
  final int id;
  final String question;
  final List<String> options;
  late int? selectedOption;
  final bool? required;

  WeightLossQuestion({
    required this.id,
    required this.question,
    required this.options,
    this.selectedOption,
    this.required,
  });

  factory WeightLossQuestion.fromJson(Map<String, dynamic> json) {
    return WeightLossQuestion(
        id: json['id'] ?? 0,
        question: json['question'] ?? '',
        options: List<String>.from(
          json['options'] ?? [],
        ),
        selectedOption: json['selectedOption'],
        required: json['required'] ?? false);
  }
}
