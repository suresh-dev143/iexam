import 'package:flutter/material.dart';
import 'package:iexam/features/Gk/models/qapair.dart';

class LearningPage extends StatelessWidget {
  final String headingTitle;
  final List<QAPair> qaPairs;

  const LearningPage({
    super.key,
    required this.headingTitle,
    required this.qaPairs,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(headingTitle),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: qaPairs.isEmpty
            ? const Center(
                child: Text(
                  "No Questions and Answers available.",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              )
            : ListView.builder(
                itemCount: qaPairs.length,
                itemBuilder: (context, index) {
                  final qa = qaPairs[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ExpansionTile(
                      title: Text(
                        qa.question,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            qa.answer,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
