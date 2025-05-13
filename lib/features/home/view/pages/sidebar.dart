import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/auth/view/pages/login_page.dart';
import 'package:iexam/features/sidecomponents/about.dart';
import 'package:iexam/features/sidecomponents/privacypolicy.dart';
import 'package:iexam/features/sidecomponents/profile.dart';
import 'package:iexam/features/sidecomponents/settings.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> logout(BuildContext context) async {
    await auth.signOut(); // Firebase logout

    // Navigate to the login page and remove all previous routes
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false, // This removes all previous screens from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.blueColor,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const CircleAvatar(
            radius: 100, // Image radius
            backgroundImage: AssetImage('assets/images/static.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'User Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomBtn.iconButton(
              'Policy Privacy',
              const Icon(
                Icons.policy,
                color: Colors.white,
              ), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage()));
          }),
          CustomBtn.iconButton(
              'Edit Profile', const Icon(Icons.edit, color: Colors.white), () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage()));
          }),
          CustomBtn.iconButton(
              'Settings', const Icon(Icons.settings, color: Colors.white), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          }),
          CustomBtn.iconButton('Share the App',
              const Icon(Icons.share, color: Colors.white), () {}),
          CustomBtn.iconButton('About Us',
              const Icon(Icons.cast_for_education, color: Colors.white), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()));
          }),
          CustomBtn.iconButton(
              'Logout', const Icon(Icons.logout, color: Colors.white), () {
            logout(context);
          }),
        ]),
      ),
    );
  }
}

class CustomBtn {
  static iconButton(String text, Icon icon, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: <Widget>[
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}
