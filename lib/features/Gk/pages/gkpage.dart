import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/Gk/widgets/CustomBtn.dart';

class GkPage extends StatelessWidget {
  const GkPage({super.key});
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Pallete.blueColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: he * 0.28,
                decoration: BoxDecoration(
                    color: Pallete.blueLightColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: he * 0.05),
                child: Image.asset('assets/images/gkover.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: he * 0.13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Image.asset('assets/images/gkover.png')],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/gkbackground.png',
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: he * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Learn GK',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: he * 0.01,
                        ),
                        const Text('with your phone in 10 min',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: he * 0.03,
                    ),
                    CustomBtn.customtn('Static GK', he * 0.4, () {}),
                    SizedBox(
                      height: he * 0.005,
                    ),
                    CustomBtn.customtn('Hindi GK', he * 0.4, () {}),
                    SizedBox(
                      height: he * 0.005,
                    ),
                    CustomBtn.customtn('Computer GK', he * 0.4, () {}),
                    SizedBox(
                      height: he * 0.005,
                    ),
                    CustomBtn.customtn('Biology GK', he * 0.4, () {}),
                    SizedBox(
                      height: he * 0.005,
                    ),
                    CustomBtn.customtn('English GK', he * 0.4, () {}),
                    SizedBox(
                      height: he * 0.005,
                    ),
                    CustomBtn.customtn('Geography GK', he * 0.4, () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
