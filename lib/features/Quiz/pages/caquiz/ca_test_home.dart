import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/caquiz/attempquiz.dart';

class CaTest extends StatelessWidget {
  const CaTest({super.key});

  @override
  Widget build(BuildContext context) {
    // var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Pallete.currentAffraisBox,
      appBar: AppBar(
        backgroundColor: Pallete.blueColor,
        // actions: const [Text('I-Exam')],
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(
      //           vertical: he * 0.04, horizontal: he * 0.03),
      //       child: Container(
      //         width: he * 0.4,
      //         height: he * 0.5,
      //         decoration: BoxDecoration(
      //             color: Pallete.currentAffraisBox,
      //             borderRadius: BorderRadius.circular(15)),
      //       ),
      //     )
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Curent Affairs Quiz",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "Test your general knowledge with this exciting quiz. Answer all the questions and see how much you know!",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.timer, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text("Duration: 10 minutes",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.question_answer, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text("Total Questions: 15",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AttempQuiz()));

                  // Navigate to quiz screen (To be implemented)
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Pallete.blueColor,
                ),
                child: const Text("Start Quiz",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
