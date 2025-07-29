import 'package:flutter/material.dart';
import 'package:iexam/features/Gk/pages/learningpage.dart';
import 'package:iexam/features/Gk/services/heading.service.dart';
import '../models/heading.dart';

class HeadingPage extends StatefulWidget {
  final String subjectId;
  final String subjectName;

  const HeadingPage({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });

  @override
  State<HeadingPage> createState() => _HeadingPageState();
}

class _HeadingPageState extends State<HeadingPage> {
  late Future<List<Heading>> _futureHeadings;

  @override
  void initState() {
    super.initState();
    _futureHeadings = HeadingService().getHeadingsBySubject(widget.subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectName,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade900,
      ),
      body: FutureBuilder<List<Heading>>(
        future: _futureHeadings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No headings found.'));
          }

          final headings = snapshot.data!;

          return ListView.builder(
            itemCount: headings.length,
            itemBuilder: (context, index) {
              final heading = headings[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.blueGrey.shade800,
                child: ListTile(
                  title: Text(
                    heading.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    heading.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.white70),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LearningPage(
                          headingTitle: heading.title,
                          qaPairs: heading.qaPairs,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
