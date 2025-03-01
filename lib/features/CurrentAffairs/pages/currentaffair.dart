import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/CurrentAffairs/pages/learnca.dart';
import 'package:iexam/features/CurrentAffairs/widgets/custom_box.dart';

class CurrentAffair extends StatelessWidget {
  const CurrentAffair({super.key});
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: he * 0.25,
                  decoration: BoxDecoration(
                      color: Pallete.blueDarkColor,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15))),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: he * 0.08, left: he * 0.01, right: he * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/group1.png',
                        height: 120,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I-EXAM',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            'Acquire knowledge\n rapidly',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: he * 0.045, vertical: he * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox.cutomBox('Today', Icons.today, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LearningCA()));
                          }),
                          CustomBox.cutomBox(
                              'Weekly', Icons.weekend_outlined, () {})
                        ],
                      ),
                      SizedBox(
                        height: he * 0.045,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox.cutomBox('Month', Icons.today, () {}),
                          CustomBox.cutomBox(
                              'Last Month', Icons.weekend_outlined, () {})
                        ],
                      ),
                      SizedBox(
                        height: he * 0.045,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomBox.cutomBox('Year', Icons.today, () {}),
                          CustomBox.cutomBox('Last Year', Icons.today, () {})
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
