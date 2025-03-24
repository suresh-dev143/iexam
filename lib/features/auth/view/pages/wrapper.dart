import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iexam/features/auth/view/pages/login_page.dart';
import 'package:iexam/features/home/view/pages/bottom_nav.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          print(snapshot);
          return BottomNav(); // Show home if the user is logged in
        } else {
          return LoginPage(); // Show sign-in screen if user is logged out
        }
      },
    );
  }
}
