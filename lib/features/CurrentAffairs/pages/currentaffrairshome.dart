import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';
import 'package:iexam/features/CurrentAffairs/pages/learnca.dart';

class CurrentAffairsHomePage extends StatefulWidget {
  const CurrentAffairsHomePage({super.key});

  @override
  State<CurrentAffairsHomePage> createState() => _CurrentAffairsHomePageState();
}

class _CurrentAffairsHomePageState extends State<CurrentAffairsHomePage> {
  final List<Map<String, dynamic>> categories = [
    {
      "title": "Politics",
      "icon": Icons.account_balance,
      "color": Colors.blue,
    },
    {
      "title": "Economy",
      "icon": Icons.trending_up,
      "color": Colors.green,
    },
    {
      "title": "Sports",
      "icon": Icons.sports_soccer,
      "color": Colors.orange,
    },
    {
      "title": "Technology",
      "icon": Icons.computer,
      "color": Colors.purple,
    },
    {
      "title": "Science",
      "icon": Icons.science,
      "color": Colors.teal,
    },
    {
      "title": "Environment",
      "icon": Icons.eco,
      "color": Colors.lightGreen,
    },
  ];

  final List<Map<String, dynamic>> latestNews = [
    {
      "title": "Global Summit on Climate Change Concludes with New Agreements",
      "summary":
          "World leaders reached consensus on reducing carbon emissions by 30% by 2030.",
      "category": "Environment",
      "time": "2 hours ago",
      "imageUrl": "assets/images/history.png",
    },
    {
      "title": "Major Tech Company Unveils Revolutionary AI Assistant",
      "summary":
          "The new AI system can understand and respond to complex human instructions with unprecedented accuracy.",
      "category": "Technology",
      "time": "5 hours ago",
      "imageUrl": "assets/images/static.png",
    },
    {
      "title": "International Space Station Makes Groundbreaking Discovery",
      "summary":
          "Astronauts have found evidence of microbial life in samples collected from the station's exterior.",
      "category": "Science",
      "time": "1 day ago",
      "imageUrl": "assets/images/computer.png",
    },
    {
      "title": "Global Economic Forum Predicts Strong Recovery in Coming Year",
      "summary":
          "Experts forecast a 4.5% growth in global GDP despite recent challenges.",
      "category": "Economy",
      "time": "1 day ago",
      "imageUrl": "assets/images/geography.png",
    },
  ];

  final List<String> timeFilters = [
    "Today",
    "This Week",
    "This Month",
    "This Year",
  ];

  String selectedTimeFilter = "Today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "Current Affairs",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {
              // Navigate to bookmarks
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured News Banner
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Pallete.gradient1,
                    Pallete.gradient2,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/computer.png", // Use a default image from your assets
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            "BREAKING",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Major International Treaty Signed by 150 Nations",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "The landmark agreement aims to address global challenges in the coming decade",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Time Filter Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: timeFilters.map((filter) {
                    bool isSelected = filter == selectedTimeFilter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTimeFilter = filter;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Pallete.gradient1
                              : Pallete.blueColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return _buildCategoryCard(
                        title: category["title"],
                        icon: category["icon"],
                        color: category["color"],
                        onTap: () {
                          // Navigate to category page
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Latest News Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Latest News",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to all news
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: Pallete.gradient1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: latestNews.length,
                    itemBuilder: (context, index) {
                      final news = latestNews[index];
                      return _buildNewsCard(
                        title: news["title"],
                        summary: news["summary"],
                        category: news["category"],
                        time: news["time"],
                        imageUrl: news["imageUrl"],
                        onTap: () {
                          // Navigate to news detail
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            // Daily Quiz Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Pallete.blueColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Test Your Knowledge",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Take our daily current affairs quiz to see how well you're keeping up with world events.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildQuizStat("15", "Questions"),
                              const SizedBox(height: 8),
                              _buildQuizStat("10 min", "Duration"),
                            ],
                          ),
                        ),
                        GradiantButton(
                          buttonText: "START QUIZ",
                          onTap: () {
                            // Navigate to quiz
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Study Material Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Study Material",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStudyMaterialCard(
                          title: "Monthly Digest",
                          icon: Icons.book,
                          onTap: () {
                            // Navigate to monthly digest
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildStudyMaterialCard(
                          title: "Important Facts",
                          icon: Icons.fact_check,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LearningCA(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard({
    required String title,
    required String summary,
    required String category,
    required String time,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Pallete.gradient2.withOpacity(0.3),
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white54,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Pallete.gradient1.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Pallete.gradient1),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: Pallete.gradient1,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    summary,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      TextButton(
                        onPressed: onTap,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "Read More",
                          style: TextStyle(
                            color: Pallete.gradient1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border,
                            color: Colors.white70),
                        onPressed: () {
                          // Bookmark functionality
                        },
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white70),
                        onPressed: () {
                          // Share functionality
                        },
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizStat(String value, String label) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Pallete.gradient1.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            label == "Questions" ? Icons.question_answer : Icons.timer,
            color: Pallete.gradient1,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStudyMaterialCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
