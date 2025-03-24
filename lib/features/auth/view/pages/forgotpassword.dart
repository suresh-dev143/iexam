import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iexam/core/common/widgets/custom_fields.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/auth/view/widgets/gradiant_btn.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _message;
  bool _isLoading = false;

  Future<void> _resetPassword() async {
    setState(() {
      _isLoading = true;
      _message = null;
    });

    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      setState(() {
        _message = "Password reset email sent! Check your inbox.";
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _message = e.message;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your email to reset your password",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: CustomFields(
                  fillColor: Pallete.textFieldColor,
                  controller: emailController,
                  hintText: 'Email Address',
                  icon: const Icon(CupertinoIcons.mail_solid),
                  textinputtype: TextInputType.emailAddress),
            ),
            SizedBox(height: 20),
            if (_message != null)
              Text(
                _message!,
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            SizedBox(height: 10),
            _isLoading
                ? CircularProgressIndicator()
                : GradiantButton(
                    buttonText: 'LOG IN',
                    buttonWidth: double.infinity,
                    onTap: () => _resetPassword()),
          ],
        ),
      ),
    );
  }
}
