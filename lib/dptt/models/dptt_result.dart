class DpttResult {
  final String type;
  final String name;
  final String best;
  final String worst;
  final List<String> comments;

  DpttResult({
    required this.type,
    required this.name,
    required this.best,
    required this.worst,
    required this.comments,
  });

  factory DpttResult.fromJson(Map<String, dynamic> json) {
    return DpttResult(
      type: json['type'],
      name: json['name'],
      best: json['best'],
      worst: json['worst'],
      comments: List<String>.from(json['comments']),
    );
  }
}
