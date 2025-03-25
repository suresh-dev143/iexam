import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/core/theme/theme.dart';
import 'package:iexam/core/common/widgets/custom_fields.dart';
import 'package:iexam/core/utils/show_snackbar.dart';
import 'package:iexam/features/auth/view/pages/forgotpassword.dart';
import 'package:iexam/features/auth/view/pages/signup_page.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';
import 'package:iexam/features/auth/view/widgets/text_btn.dart';
import 'package:iexam/features/home/view/pages/bottom_nav.dart';
import 'package:iexam/features/home/view/pages/home_page.dart';
import 'package:iexam/features/splash/splash_page.dart';
import 'package:iexam/firebase_services/auth_services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const _Login(),
    );
  }
}

class _Login extends StatefulWidget {
  const _Login();
  @override
  State<_Login> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  final FirebaseAuthService auth = FirebaseAuthService();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passcontroler = TextEditingController();
  bool isLoading = false;
  String? _errorMessage;
  login() async {
    setState(() => isLoading = true);
    User? user = await auth.signinWithEmainAndPassword(
        emailcontroler.text, passcontroler.text);
    setState(() => isLoading = false);
    if (user != null) {
      successToast(message: 'Log in successfully');
      Get.offAll(() => BottomNav());
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
                "assets/images/login.png",
                color: const Color.fromRGBO(255, 255, 255, 0.07),
              )),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top: he * 0.08, left: he * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Spalash()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Pallete.titleTextColor,
                        ),
                      ),
                      SizedBox(
                        height: he * 0.09,
                      ),
                      const Text(
                        "Welcome",
                        style: TextStyle(fontSize: 45),
                      ),
                      Text("Back!",
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Pallete.textColor)),
                    ],
                  ),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: he * 0.04, vertical: he * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: he * 0.01,
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? n) {}),
                      const Text('Remember')
                    ],
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: isLoading
                        ? CircularProgressIndicator()
                        : GradiantButton(
                            buttonText: 'LOG IN',
                            buttonWidth: double.infinity,
                            onTap: () => login()),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  TextBtn(
                    btnText: 'Forgot Password?',
                    btnColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordPage()));
                    },
                    textDecoration: TextDecoration.underline,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: he * 0.015, top: he * 0.07),
                    child: Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        TextBtn(
                          btnText: 'Sign up',
                          btnColor: Pallete.textColor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
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
    );
  }
}
