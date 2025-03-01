import 'package:flutter/material.dart';

class AttempQuiz extends StatefulWidget {
  const AttempQuiz({super.key});

  @override
  State<AttempQuiz> createState() => _AttempQuizState();
}

class _AttempQuizState extends State<AttempQuiz> {
  int currentQuestionIndex = 0;
  List<String> questions = [
    "What is the capital of France?",
    "Which planet is known as the Red Planet?",
    "What is the largest mammal?"
  ];
  List<List<String>> options = [
    ["Paris", "London", "Berlin", "Madrid"],
    ["Earth", "Mars", "Jupiter", "Venus"],
    ["Elephant", "Blue Whale", "Giraffe", "Shark"]
  ];
  int? selectedOption;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
      });
    } else {
      // Show quiz completion message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Quiz Completed"),
          content: const Text("You have completed the quiz!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Test"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1}/${questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Column(
              children:
                  List.generate(options[currentQuestionIndex].length, (index) {
                return RadioListTile<int>(
                  title: Text(options[currentQuestionIndex][index]),
                  value: index,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                );
              }),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedOption != null ? nextQuestion : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blueAccent,
                ),
                child: const Text("Next", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
