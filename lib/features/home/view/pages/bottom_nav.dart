import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';
import 'package:iexam/features/CurrentAffairs/pages/currentaffair.dart';
import 'package:iexam/features/Gk/pages/gkpage.dart';
import 'package:iexam/features/Quiz/pages/quiz_page.dart';
import 'package:iexam/features/home/view/pages/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const GkPage(),
    const CurrentAffair(),
    const QuizPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Pallete.dividerColor,
          unselectedItemColor: Colors.white,
          backgroundColor: Pallete.blueDarkColor,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'GK'),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper), label: 'CURRENT AFFAIR'),
            BottomNavigationBarItem(
                icon: Icon(Icons.quiz_outlined), label: 'QUIZ')
          ]),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
