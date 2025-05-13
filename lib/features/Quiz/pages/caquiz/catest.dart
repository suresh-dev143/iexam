import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/caquiz/ca_test_home.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';

class CATest extends StatelessWidget {
  final List<Map<String, dynamic>> quizzes = [
    {
      "title": "Math Quiz",
      "questions": 10,
      "duration": "30 mins",
      "difficulty": "Medium",
      "description":
          "Test your mathematical skills with algebra, geometry, and arithmetic problems.",
      "completed": false,
      "score": null,
    },
    {
      "title": "Science Quiz",
      "questions": 15,
      "duration": "45 mins",
      "difficulty": "Hard",
      "description":
          "Explore physics, chemistry, and biology concepts through challenging questions.",
      "completed": true,
      "score": 85,
    },
    {
      "title": "History Quiz",
      "questions": 12,
      "duration": "35 mins",
      "difficulty": "Easy",
      "description":
          "Journey through world history with questions about major events and figures.",
      "completed": true,
      "score": 92,
    },
    {
      "title": "Geography Quiz",
      "questions": 8,
      "duration": "25 mins",
      "difficulty": "Medium",
      "description":
          "Test your knowledge of world geography, countries, and landmarks.",
      "completed": false,
      "score": null,
    },
  ];
  CATest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "Available Tests",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Implement filter functionality
              _showFilterDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search tests...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Pallete.blueColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Implement search functionality
              },
            ),
          ),

          // Quiz List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return _buildQuizCard(context, quiz);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context, Map<String, dynamic> quiz) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Pallete.blueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _showQuizDetails(context, quiz);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CaTestHome()));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        quiz["title"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildDifficultyBadge(quiz["difficulty"]),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  quiz["description"],
                  style: const TextStyle(color: Colors.white70),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildInfoChip(Icons.question_answer,
                        "${quiz["questions"]} Questions"),
                    const SizedBox(width: 12),
                    _buildInfoChip(Icons.timer, quiz["duration"]),
                    const Spacer(),
                    if (quiz["completed"]) _buildScoreBadge(quiz["score"])
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyBadge(String difficulty) {
    Color badgeColor;
    switch (difficulty.toLowerCase()) {
      case 'easy':
        badgeColor = Colors.green;
        break;
      case 'medium':
        badgeColor = Colors.orange;
        break;
      case 'hard':
        badgeColor = Colors.red;
        break;
      default:
        badgeColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: badgeColor),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          color: badgeColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white70),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildScoreBadge(int score) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Pallete.gradient1,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Pallete.gradient1),
      ),
      child: Text(
        "Score: $score%",
        style: TextStyle(
          color: Pallete.gradient1,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showQuizDetails(BuildContext context, Map<String, dynamic> quiz) {
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
            Text(
              quiz["title"],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              quiz["description"],
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDetailItem(
                    Icons.question_answer, "${quiz["questions"]} Questions"),
                _buildDetailItem(Icons.timer, quiz["duration"]),
                _buildDetailItem(Icons.bar_chart, quiz["difficulty"]),
              ],
            ),
            const SizedBox(height: 24),
            GradiantButton(
              buttonText: quiz["completed"] ? "RETAKE TEST" : "START TEST",
              buttonWidth: double.infinity,
              onTap: () {
                // Navigate to quiz page
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            if (!quiz["completed"])
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Maybe Later",
                    style: TextStyle(color: Pallete.textColor),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "Filter Tests",
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFilterOption("All Tests"),
            _buildFilterOption("Completed Tests"),
            _buildFilterOption("Pending Tests"),
            _buildFilterOption("Easy Difficulty"),
            _buildFilterOption("Medium Difficulty"),
            _buildFilterOption("Hard Difficulty"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: Pallete.textColor),
            ),
          ),
          TextButton(
            onPressed: () {
              // Apply filters
              Navigator.pop(context);
            },
            child: const Text(
              "Apply",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String label) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      leading: const Icon(Icons.check_box_outline_blank, color: Colors.white),
      onTap: () {
        // Toggle filter option
      },
    );
  }
}
