import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/gkquiz/gktest.dart';

class GKQuizSubject extends StatefulWidget {
  const GKQuizSubject({super.key});

  @override
  State<GKQuizSubject> createState() => _GKQuizSubjectState();
}

class _GKQuizSubjectState extends State<GKQuizSubject> {
  final List<Map<String, dynamic>> subjects = [
    {
      "name": "History",
      "icon": Icons.history_edu,
      "color": Colors.amber.shade700,
      "questions": 30,
      "description": "Ancient civilizations to modern events",
    },
    {
      "name": "Geography",
      "icon": Icons.public,
      "color": Colors.green.shade600,
      "questions": 25,
      "description": "Countries, landforms, and natural resources",
    },
    {
      "name": "Science",
      "icon": Icons.science,
      "color": Colors.blue.shade600,
      "questions": 28,
      "description": "Physics, chemistry, and biology concepts",
    },
    {
      "name": "Computer",
      "icon": Icons.computer,
      "color": Colors.purple.shade600,
      "questions": 22,
      "description": "Hardware, software, and programming",
    },
    {
      "name": "Polity",
      "icon": Icons.account_balance,
      "color": Colors.red.shade600,
      "questions": 26,
      "description": "Government systems and political concepts",
    },
    {
      "name": "Economics",
      "icon": Icons.attach_money,
      "color": Colors.teal.shade600,
      "questions": 20,
      "description": "Financial systems and economic theories",
    },
    {
      "name": "Literature",
      "icon": Icons.book,
      "color": Colors.indigo.shade600,
      "questions": 18,
      "description": "Famous authors and literary works",
    },
    {
      "name": "Sports",
      "icon": Icons.sports_soccer,
      "color": Colors.orange.shade600,
      "questions": 24,
      "description": "Athletes, tournaments, and sports history",
    },
    {
      "name": "Arts & Culture",
      "icon": Icons.palette,
      "color": Colors.pink.shade600,
      "questions": 15,
      "description": "Paintings, music, and cultural heritage",
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    var filteredSubjects = subjects
        .where((subject) => subject["name"]
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          'General Knowledge Subjects',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search subjects...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Pallete.blueColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Subject Categories
          Expanded(
            child: filteredSubjects.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No subjects found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    itemCount: filteredSubjects.length,
                    itemBuilder: (context, index) {
                      final subject = filteredSubjects[index];
                      return _buildSubjectCard(
                        name: subject["name"],
                        icon: subject["icon"],
                        color: subject["color"],
                        questions: subject["questions"],
                        description: subject["description"],
                      );
                    },
                  ),
          ),
        ],
      ),
      // Traditional list view as a fallback option
      bottomNavigationBar: Container(
        height: 60,
        color: Pallete.blueColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.view_list, color: Colors.white70),
              label: const Text(
                "Switch to List View",
                style: TextStyle(color: Colors.white70),
              ),
              onPressed: () {
                _showListViewDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubjectCard({
    required String name,
    required IconData icon,
    required Color color,
    required int questions,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GKTest()),
        );
      },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject Header with Icon
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
            ),

            // Subject Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "$questions Qs",
                            style: TextStyle(
                              color: color,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white54,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Pallete.blueColor,
          title: const Text(
            "About GK Quiz",
            style: TextStyle(color: Colors.white),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Test your knowledge across various subjects with our comprehensive General Knowledge quizzes.",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 16),
              Text(
                "Features:",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "• Multiple subjects to choose from\n• Thousands of questions\n• Track your progress\n• Compete with friends",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showListViewDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Pallete.blueDarkColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Select a Subject",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    return ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: subject["color"],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          subject["icon"],
                          color: subject["color"],
                        ),
                      ),
                      title: Text(
                        subject["name"],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${subject["questions"]} Questions",
                        style: const TextStyle(color: Colors.white54),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white54, size: 16),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GKTest()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
