import 'package:flutter/material.dart';

class LearningPage extends StatelessWidget {
  final List<Map<String, String>> questionsAndAnswers = [
    {"question": "What is the capital of France?", "answer": "Paris"},
    {"question": "Who wrote 'Hamlet'?", "answer": "William Shakespeare"},
    {
      "question": "What is the largest planet in our solar system?",
      "answer": "Jupiter"
    },
    {"question": "How many continents are there?", "answer": "Seven"},
    {
      "question": "What is the boiling point of water?",
      "answer": "100°C or 212°F"
    },
  ];

  LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Q&A"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questionsAndAnswers.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                title: Text(
                  questionsAndAnswers[index]["question"]!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      questionsAndAnswers[index]["answer"]!,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
