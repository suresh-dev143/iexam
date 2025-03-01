import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/pages/gkquiz/gktest.dart';
import 'package:iexam/features/Quiz/widgets/subject_container.dart';

class GKQuizSubject extends StatelessWidget {
  const GKQuizSubject({super.key});
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Pallete.blueColor,
      appBar: AppBar(
        title: const Text(
          'GK Quiz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.blueColor,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: he * 0.02),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: he * 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/circle.png',
                      width: double.infinity,
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SubContainer.subContainer('Hindi', he * 0.31, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GKTest()));
                  }),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('English', he * 0.31, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GKTest()));
                  }),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('Geography', he * 0.31, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GKTest()));
                  }),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('Computer', he * 0.31, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GKTest()));
                  }),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('History', he * 0.31, () {}),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('Polity Science', he * 0.31, () {}),
                  SizedBox(
                    height: he * 0.005,
                  ),
                  SubContainer.subContainer('Economics', he * 0.31, () {}),
                  SizedBox(
                    height: he * 0.005,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
