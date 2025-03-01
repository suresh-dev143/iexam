import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Quiz/widgets/custom_container.dart';

class GKTest extends StatelessWidget {
  const GKTest({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Pallete.blueColor,
      appBar: AppBar(
        title: const Text(
          'GK Test',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Pallete.blueColor,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.white,
        // ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Stack(
            //   children: [

            //     Padding(
            //       padding: EdgeInsets.only(top: he * 0.05),
            //       child: Image.asset('assets/images/gkover.png'),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(top: he * 0.13),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [Image.asset('assets/images/gkover.png')],
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                CustomContainer.customContainer('Test1', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                  width: he * 0.5,
                ),
                CustomContainer.customContainer('Test2', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
                CustomContainer.customContainer('Test3', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
                CustomContainer.customContainer('Test4', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
                CustomContainer.customContainer('Test5', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
                CustomContainer.customContainer('Test6', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
                CustomContainer.customContainer('Test6', he * 0.4, () {}),
                SizedBox(
                  height: he * 0.005,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
