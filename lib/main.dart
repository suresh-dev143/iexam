import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iexam/features/auth/view/pages/signup_page.dart';
import 'package:iexam/features/auth/view/pages/wrapper.dart';
import 'package:iexam/features/home/view/pages/bottom_nav.dart';
import 'package:iexam/features/splash/splash_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance.setLanguageCode("en");
    print("Firebase Initialized Successfully!");
  } catch (e) {
    print("Firebase Initialization Failed: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  Locale locale = Locale('en');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: Wrapper());
  }
}
