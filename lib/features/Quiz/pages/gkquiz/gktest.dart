import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class GKTest extends StatelessWidget {
  const GKTest({super.key});

  @override
  Widget build(BuildContext context) {
    // List of GK test categories with descriptive names
    final List<Map<String, dynamic>> gkTests = [
      {
        'title': 'World History',
        'subtitle': '25 questions • 30 minutes',
        'icon': Icons.history_edu,
      },
      {
        'title': 'Geography & Maps',
        'subtitle': '20 questions • 25 minutes',
        'icon': Icons.public,
      },
      {
        'title': 'Science & Technology',
        'subtitle': '30 questions • 35 minutes',
        'icon': Icons.science,
      },
      {
        'title': 'Current Affairs',
        'subtitle': '15 questions • 20 minutes',
        'icon': Icons.newspaper,
      },
      {
        'title': 'Sports & Entertainment',
        'subtitle': '20 questions • 25 minutes',
        'icon': Icons.sports_soccer,
      },
      {
        'title': 'Art & Literature',
        'subtitle': '15 questions • 20 minutes',
        'icon': Icons.menu_book,
      },
      {
        'title': 'Mixed GK Challenge',
        'subtitle': '40 questions • 45 minutes',
        'icon': Icons.quiz,
      },
    ];

    return Scaffold(
      backgroundColor: Pallete.blueColor,
      appBar: AppBar(
        title: const Text(
          'General Knowledge Tests',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Pallete.blueColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // Show info about GK tests
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('About GK Tests'),
                  content: const Text(
                    'These tests cover various aspects of general knowledge to help you prepare for competitive exams.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -50,
            right: -50,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/gkover.png',
                width: 200,
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/gkover.png',
                width: 150,
              ),
            ),
          ),

          // Main content
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Select a test to begin',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: gkTests.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: _buildTestCard(
                          context,
                          gkTests[index]['title'],
                          gkTests[index]['subtitle'],
                          gkTests[index]['icon'],
                          () {
                            // Navigate to the specific test
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Starting ${gkTests[index]['title']} test'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                            // Add your navigation logic here
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestCard(BuildContext context, String title, String subtitle,
      IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Pallete.blueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Pallete.blueColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
