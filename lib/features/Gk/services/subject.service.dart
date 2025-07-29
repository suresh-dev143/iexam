import 'dart:convert';
import 'package:iexam/features/Gk/models/subject.dart';
import 'package:http/http.dart' as http;

class SubjectService {
  static const String baseUrl = 'https://iexamapi.onrender.com';
  static const String getAllSubjectsEndpoint = '/gk/getAllSubject';

  Future<List<Subject>> getAllSubjects() async {
    final url = Uri.parse(baseUrl + getAllSubjectsEndpoint);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true) {
          List<dynamic> subjectsJson = data['data'];
          return subjectsJson.map((json) => Subject.fromJson(json)).toList();
        } else {
          throw Exception('Failed to fetch subjects: ${data['message']}');
        }
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching subjects: $e');
    }
  }
}
