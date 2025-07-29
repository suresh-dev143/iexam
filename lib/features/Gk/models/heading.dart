import 'package:iexam/features/Gk/models/qapair.dart';

class Heading {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  final List<QAPair> qaPairs;

  Heading({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.qaPairs,
  });

  factory Heading.fromJson(Map<String, dynamic> json) {
    return Heading(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      qaPairs: (json['qaPairs'] as List<dynamic>?)
              ?.map((item) => QAPair.fromJson(item))
              .toList() ??
          [],
    );
  }
}
