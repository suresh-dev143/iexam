import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Gk/pages/heading_page.dart';
import 'package:iexam/features/Gk/pages/learningpage.dart';
import 'package:iexam/features/Gk/services/subject.service.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';
import 'package:iexam/features/Gk/models/subject.dart';

class GkHome extends StatefulWidget {
  const GkHome({super.key});

  @override
  State<GkHome> createState() => _GkHomeState();
}

class _GkHomeState extends State<GkHome> {
  late Future<List<Subject>> _futureSubjects;

  @override
  void initState() {
    super.initState();
    _futureSubjects = SubjectService().getAllSubjects();
  }

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
      body: FutureBuilder<List<Subject>>(
        future: _futureSubjects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No subjects found.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final subjects = snapshot.data!;

          return GridView.builder(
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
          );
        },
      ),
    );
  }

  Widget _buildSubjectCard(BuildContext context, Subject subject) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HeadingPage(
            subjectId: subject.id,
            subjectName: subject.name,
          ),
        ),
      ),
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
              Icons.book, // Placeholder icon
              size: 40,
              color: Pallete.gradient1,
            ),
            const SizedBox(height: 12),
            Text(
              subject.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subject.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                value: 0.0, // You can set actual progress if available
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Pallete.gradient1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "0% Complete",
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
