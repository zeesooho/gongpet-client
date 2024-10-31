class DpttQuestion {
  final String question;
  final String option;
  final int vector;

  DpttQuestion({required this.question, required this.option, required this.vector});

  factory DpttQuestion.fromJson(Map<String, dynamic> json) {
    return DpttQuestion(
      question: json['question'],
      option: json['option'],
      vector: json['vector'],
    );
  }
}
