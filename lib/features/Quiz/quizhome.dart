import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/caquiz/catest.dart';
import 'package:iexam/features/Quiz/pages/gkquiz/quizsubjects.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';

class QuizHomePage extends StatefulWidget {
  const QuizHomePage({super.key});

  @override
  State<QuizHomePage> createState() => _QuizHomePageState();
}

class _QuizHomePageState extends State<QuizHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> featuredQuizzes = [
    {
      "title": "Daily Challenge",
      "description": "Test your knowledge with today's quiz challenge",
      "icon": Icons.calendar_today,
      "questions": 10,
      "time": "5 min",
      "type": "Current Affairs"
    },
    {
      "title": "Weekly Special",
      "description": "Comprehensive quiz covering this week's events",
      "icon": Icons.event_note,
      "questions": 20,
      "time": "15 min",
      "type": "Current Affairs"
    },
    {
      "title": "Geography Master",
      "description": "Test your knowledge of world geography",
      "icon": Icons.public,
      "questions": 15,
      "time": "10 min",
      "type": "GK"
    },
  ];

  final List<Map<String, dynamic>> caCategories = [
    {
      "title": "Politics",
      "icon": Icons.account_balance,
      "color": Colors.blue,
      "questions": 25,
    },
    {
      "title": "Sports",
      "icon": Icons.sports_soccer,
      "color": Colors.green,
      "questions": 20,
    },
    {
      "title": "Business",
      "icon": Icons.business,
      "color": Colors.amber,
      "questions": 15,
    },
    {
      "title": "Technology",
      "icon": Icons.computer,
      "color": Colors.purple,
      "questions": 18,
    },
    {
      "title": "Science",
      "icon": Icons.science,
      "color": Colors.teal,
      "questions": 22,
    },
    {
      "title": "Entertainment",
      "icon": Icons.movie,
      "color": Colors.red,
      "questions": 15,
    },
  ];

  final List<Map<String, dynamic>> gkCategories = [
    {
      "title": "History",
      "icon": Icons.history_edu,
      "color": Colors.brown,
      "questions": 30,
    },
    {
      "title": "Geography",
      "icon": Icons.public,
      "color": Colors.green,
      "questions": 25,
    },
    {
      "title": "Science",
      "icon": Icons.science,
      "color": Colors.blue,
      "questions": 28,
    },
    {
      "title": "Literature",
      "icon": Icons.book,
      "color": Colors.amber,
      "questions": 20,
    },
    {
      "title": "Computer",
      "icon": Icons.computer,
      "color": Colors.purple,
      "questions": 22,
    },
    {
      "title": "Economics",
      "icon": Icons.attach_money,
      "color": Colors.green.shade700,
      "questions": 18,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.blueDarkColor,
      appBar: AppBar(
        backgroundColor: Pallete.blueDarkColor,
        title: const Text(
          "Quiz Hub",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: Colors.white),
            onPressed: () {
              // Navigate to quiz history
            },
          ),
          IconButton(
            icon: const Icon(Icons.leaderboard, color: Colors.white),
            onPressed: () {
              // Navigate to leaderboard
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Pallete.gradient1,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: "CURRENT AFFAIRS"),
            Tab(text: "GENERAL KNOWLEDGE"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Current Affairs Tab
          _buildCurrentAffairsTab(),

          // General Knowledge Tab
          _buildGeneralKnowledgeTab(),
        ],
      ),
    );
  }

  Widget _buildCurrentAffairsTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            _buildHeroSection(
              title: "Current Affairs Quiz",
              description:
                  "Stay updated with the latest events around the world",
              imagePath: "assets/images/image(8).png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CATest()),
                );
              },
            ),

            const SizedBox(height: 24),

            // Stats Section
            _buildStatsSection(),

            const SizedBox(height: 24),

            // Featured Quizzes
            const Text(
              "Featured Quizzes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredQuizzes.length,
                itemBuilder: (context, index) {
                  final quiz = featuredQuizzes[index];
                  if (quiz["type"] == "Current Affairs") {
                    return _buildFeaturedQuizCard(quiz);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // View all categories
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: caCategories.length,
              itemBuilder: (context, index) {
                final category = caCategories[index];
                return _buildCategoryCard(
                  title: category["title"],
                  icon: category["icon"],
                  color: category["color"],
                  questions: category["questions"],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CATest()),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // Daily Challenge Button
            GradiantButton(
              buttonText: "START DAILY CHALLENGE",
              buttonWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CATest()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralKnowledgeTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            _buildHeroSection(
              title: "General Knowledge Quiz",
              description: "Test your knowledge across various subjects",
              imagePath: "assets/images/image(7).png",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GKQuizSubject()),
                );
              },
            ),

            const SizedBox(height: 24),

            // Stats Section
            _buildStatsSection(isGK: true),

            const SizedBox(height: 24),

            // Featured Quizzes
            const Text(
              "Featured Quizzes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredQuizzes.length,
                itemBuilder: (context, index) {
                  final quiz = featuredQuizzes[index];
                  if (quiz["type"] == "GK") {
                    return _buildFeaturedQuizCard(quiz);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Subject Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GKQuizSubject()),
                    );
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: gkCategories.length,
              itemBuilder: (context, index) {
                final category = gkCategories[index];
                return _buildCategoryCard(
                  title: category["title"],
                  icon: category["icon"],
                  color: category["color"],
                  questions: category["questions"],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GKQuizSubject()),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // Practice Quiz Button
            GradiantButton(
              buttonText: "EXPLORE ALL SUBJECTS",
              buttonWidth: double.infinity,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GKQuizSubject()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection({
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Pallete.blueGradient1,
              Pallete.blueGradient2,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              bottom: -20,
              child: Opacity(
                opacity: 0.6,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Start Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection({bool isGK = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Pallete.blueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            value: isGK ? "150+" : "50+",
            label: "Quizzes",
            icon: Icons.quiz,
          ),
          _buildStatItem(
            value: isGK ? "1000+" : "500+",
            label: "Questions",
            icon: Icons.question_answer,
          ),
          _buildStatItem(
            value: isGK ? "7" : "6",
            label: "Categories",
            icon: Icons.category,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required IconData icon,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Pallete.gradient1.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Pallete.gradient1,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedQuizCard(Map<String, dynamic> quiz) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Pallete.blueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (quiz["type"] == "Current Affairs") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CATest()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GKQuizSubject()),
              );
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Pallete.gradient1.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        quiz["icon"],
                        color: Pallete.gradient1,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Pallete.gradient1.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        quiz["type"],
                        style: TextStyle(
                          color: Pallete.gradient1,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  quiz["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  quiz["description"],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Row(
                  children: [
                    _buildQuizInfoChip(
                      icon: Icons.question_answer,
                      label: "${quiz["questions"]} Questions",
                    ),
                    const SizedBox(width: 8),
                    _buildQuizInfoChip(
                      icon: Icons.timer,
                      label: quiz["time"],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizInfoChip({required IconData icon, required String label}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required IconData icon,
    required Color color,
    required int questions,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.blueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "$questions Questions",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
