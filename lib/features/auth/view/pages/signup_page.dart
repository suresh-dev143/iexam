import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iexam/core/common/widgets/custom_fields.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/core/theme/theme.dart';
import 'package:iexam/core/utils/show_snackbar.dart';
import 'package:iexam/features/auth/view/pages/login_page.dart';
import 'package:iexam/features/auth/view/pages/wrapper.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';
import 'package:iexam/features/auth/view/widgets/text_btn.dart';
import 'package:iexam/firebase_services/auth_services.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const _Signup(),
    );
  }
}

class _Signup extends StatefulWidget {
  const _Signup();

  @override
  State<_Signup> createState() => _SignupState();
}

class _SignupState extends State<_Signup> {
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passcontroler = TextEditingController();
  TextEditingController namecontroler = TextEditingController();

  bool isLoading = false;
  signup() async {
    setState(() => isLoading = true);

    print('triggered');
    User? user = await auth.signUpWithEmainAndPassword(
        "hello123@gmail.com", "hello@123");

    setState(() => isLoading = false);
    if (user != null) {
      showToast(message: 'User is successfully created');
      Get.offAll(() => Wrapper());
    } else {
      showToast(message: 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                  child: Image.asset(
                "assets/images/auth.png",
                color: const Color.fromRGBO(255, 255, 255, 0.07),
              )),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: he * 0.05, left: he * 0.04, right: he * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Pallete.titleTextColor,
                      ),
                      SizedBox(
                        height: he * 0.05,
                      ),
                      const Text(
                        "Create an",
                        style: TextStyle(fontSize: 45),
                      ),
                      Text("Account!",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Pallete.textColor)),
                      Padding(
                        padding: EdgeInsets.only(top: he * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: namecontroler,
                                  hintText: 'Name',
                                  icon: const Icon(CupertinoIcons.person),
                                  textinputtype: TextInputType.text),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: emailcontroler,
                                  hintText: 'Email Address',
                                  icon: const Icon(CupertinoIcons.mail_solid),
                                  textinputtype: TextInputType.emailAddress),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: passcontroler,
                                  hintText: 'Password',
                                  isObscureText: true,
                                  icon: const Icon(CupertinoIcons.lock),
                                  iconSuffix: const Icon(CupertinoIcons.eye),
                                  textinputtype: TextInputType.visiblePassword),
                            ),
                            SizedBox(
                              height: he * 0.04,
                            ),
                            SizedBox(
                              height: 60,
                              child: CustomFields(
                                  fillColor: Pallete.textFieldColor,
                                  controller: passcontroler,
                                  hintText: 'Confirm Password',
                                  isObscureText: true,
                                  icon: const Icon(CupertinoIcons.lock),
                                  iconSuffix: const Icon(CupertinoIcons.eye),
                                  textinputtype: TextInputType.visiblePassword),
                            ),
                            SizedBox(
                              height: he * 0.06,
                            ),
                            isLoading
                                ? CircularProgressIndicator()
                                : GradiantButton(
                                    buttonText: 'Sign Up',
                                    buttonWidth: double.infinity,
                                    onTap: () => signup()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: he * 0.015, top: he * 0.03),
                              child: Row(
                                children: [
                                  const Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ),
                                  TextBtn(
                                    btnText: 'Login',
                                    btnColor: Pallete.textColor,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    textDecoration: TextDecoration.underline,
                                    decorationColor: Pallete.textColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
