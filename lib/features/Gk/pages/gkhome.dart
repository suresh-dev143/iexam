import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Gk/pages/learningpage.dart';

class GkHome extends StatelessWidget {
  GkHome({super.key});
  final List<Map<String, String>> gkTopics = [
    {
      "title": "History",
      "description": "Learn about world and national history."
    },
    {
      "title": "Geography",
      "description": "Explore maps, places, and environments."
    },
    {
      "title": "Science",
      "description": "Understand scientific principles and discoveries."
    },
    {
      "title": "Current Affairs",
      "description": "Stay updated with the latest news and events."
    },
    {
      "title": "Sports",
      "description": "Know about famous sports and athletes."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        title: const Text(
          "GK Subjects",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.blueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: gkTopics.length,
          itemBuilder: (context, index) {
            return Card(
              color: Pallete.blueColor,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  gkTopics[index]["title"]!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
                subtitle: Text(gkTopics[index]["description"]!,
                    style: const TextStyle(color: Colors.white54)),
                leading: const Icon(Icons.menu_book,
                    color: Colors.lightBlue, size: 40),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LearningPage()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
