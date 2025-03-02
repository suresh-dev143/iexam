import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/caquiz/catest.dart';
import 'package:iexam/features/Quiz/pages/gkquiz/gkquizsubject.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Pallete.blueDarkColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/circle.png',
                  width: double.infinity,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: he * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Pallete.blueColor),
                        child: Padding(
                          padding: EdgeInsets.all(he * 0.02),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GKQuizSubject()));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: he * 0.1,
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      'assets/images/image(7).png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'GK Quiz',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Pallete.blueColor),
                        child: Padding(
                          padding: EdgeInsets.all(he * 0.02),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CATest()));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: he * 0.1,
                                  child: ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      'assets/images/image(8).png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'C.A Quiz',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
