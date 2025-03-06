import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iexam/features/home/view/pages/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase Initialized Successfully!");
  } catch (e) {
    print("Firebase Initialization Failed: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: BottomNav());
  }
}
