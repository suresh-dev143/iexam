class QAPair {
  final String id;
  final String question;
  final String answer;
  final String createdBy;
  final DateTime lastUpdated;

  QAPair({
    required this.id,
    required this.question,
    required this.answer,
    required this.createdBy,
    required this.lastUpdated,
  });

  factory QAPair.fromJson(Map<String, dynamic> json) {
    return QAPair(
      id: json['_id'] ?? '',
      question: json['question'] ?? '',
      answer: json['answer'] ?? '',
      createdBy: json['createdBy'] ?? '',
      lastUpdated:
          DateTime.tryParse(json['lastUpdated'] ?? '') ?? DateTime.now(),
    );
  }
}
