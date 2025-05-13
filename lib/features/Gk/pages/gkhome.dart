import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Gk/pages/learningpage.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';

class GkHome extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {
      "title": "World History",
      "icon": Icons.history_edu,
      "topics": 8,
      "description":
          "Ancient civilizations, world wars, and major historical events",
      "progress": 0.4,
      "categories": [
        "Ancient History",
        "Medieval Period",
        "Modern Era",
        "World Wars"
      ],
    },
    {
      "title": "Geography",
      "icon": Icons.public,
      "topics": 12,
      "description":
          "Countries, capitals, physical features, and climate zones",
      "progress": 0.7,
      "categories": [
        "Physical Geography",
        "Political Geography",
        "Climate",
        "Landforms"
      ],
    },
    {
      "title": "Current Affairs",
      "icon": Icons.newspaper,
      "topics": 15,
      "description": "Latest news, international relations, and global events",
      "progress": 0.2,
      "categories": [
        "Politics",
        "Economics",
        "Sports",
        "International Relations"
      ],
    },
    {
      "title": "Science & Technology",
      "icon": Icons.science,
      "topics": 10,
      "description":
          "Scientific discoveries, inventions, and technological advancements",
      "progress": 0.6,
      "categories": [
        "Inventions",
        "Space",
        "Technology",
        "Scientific Discoveries"
      ],
    },
    {
      "title": "Arts & Culture",
      "icon": Icons.palette,
      "topics": 6,
      "description": "Art history, literature, music, and cultural heritage",
      "progress": 0.3,
      "categories": ["Fine Arts", "Literature", "Music", "Cultural Heritage"],
    },
    {
      "title": "Sports & Games",
      "icon": Icons.sports_soccer,
      "topics": 9,
      "description":
          "Sports history, rules, championships, and famous athletes",
      "progress": 0.5,
      "categories": [
        "Olympic Games",
        "World Cups",
        "Sports Rules",
        "Famous Athletes"
      ],
    },
  ];

  GkHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "General Knowledge",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () => _showInfo(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   "Explore Topics",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 8),
                Text(
                  "Select a subject to start learning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Subjects Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return _buildSubjectCard(context, subject);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, Map<String, dynamic> subject) {
    return GestureDetector(
      onTap: () => _showSubjectDetails(context, subject),
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              subject["icon"],
              size: 40,
              color: Pallete.gradient1,
            ),
            const SizedBox(height: 12),
            Text(
              subject["title"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              "${subject["topics"]} Topics",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: subject["progress"],
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Pallete.gradient1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "${(subject["progress"] * 100).toInt()}% Complete",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSubjectDetails(BuildContext context, Map<String, dynamic> subject) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Pallete.blueDarkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  subject["icon"],
                  size: 30,
                  color: Pallete.gradient1,
                ),
                const SizedBox(width: 12),
                Text(
                  subject["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              subject["description"],
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Categories:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (subject["categories"] as List<String>)
                  .map((category) => _buildCategoryChip(category))
                  .toList(),
            ),
            const SizedBox(height: 24),
            GradiantButton(
              buttonText: "START LEARNING",
              buttonWidth: double.infinity,
              onTap: () {
                // Navigate to subject content
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LearningPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Pallete.blueColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Pallete.gradient1),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }

  void _showInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "About General Knowledge",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "General Knowledge covers a wide range of topics that help you understand the world better. Each subject contains carefully curated content to help you learn and prepare for competitive exams.",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Got it",
              style: TextStyle(color: Pallete.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
