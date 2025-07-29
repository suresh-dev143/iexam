import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/heading.dart';

class HeadingService {
  static const String baseUrl = 'https://iexamapi.onrender.com';

  Future<List<Heading>> getHeadingsBySubject(String subjectId) async {
    final url = Uri.parse('$baseUrl/gk/gkSubject/$subjectId/getAllHeadings');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true) {
          List<dynamic> headingsJson = data['data'];
          return headingsJson.map((json) => Heading.fromJson(json)).toList();
        } else {
          throw Exception('Failed to fetch headings: ${data['message']}');
        }
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching headings: $e');
    }
  }
}
