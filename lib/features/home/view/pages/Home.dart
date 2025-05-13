// import 'package:flutter/material.dart';
// import 'package:iexam/core/theme/app_pallete.dart';
// import 'package:iexam/features/home/view/pages/carousel_slider.dart';
// import 'package:iexam/features/home/view/pages/sidebar.dart';
// import 'package:iexam/features/home/view/widgets/custom_ui.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var he = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Pallete.blueDarkColor,
//       appBar: _appBar(context),
//       drawer: Sidebar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: he * 0.012),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: he * 0.05),
//                 child: const SizedBox(
//                   child: CarouselWithIndicatorDemo(),
//                 ),
//               ),
//               Container(
//                 height: double.maxFinite,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(30))),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding:
//                             EdgeInsets.only(left: he * 0.02, top: he * 0.02),
//                         child: CustomUi.homeHeading('CURRENT AFFAIRS'),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Padding(
//                           padding:
//                               EdgeInsets.only(left: he * 0.02, top: he * 0.01),
//                           child: Row(
//                             children: [
//                               InkWell(child: CustomUi.currentBox('Today', 90)),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               InkWell(
//                                   child: CustomUi.currentBox('This week', 130)),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               InkWell(child: CustomUi.currentBox('More', 90)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsets.only(left: he * 0.02, top: he * 0.02),
//                         child: CustomUi.homeHeading('GENERAL KNOWLEDGE'),
//                       ),
//                       Padding(
//                           padding:
//                               EdgeInsets.only(left: he * 0.02, top: he * 0.01),
//                           child: Row(
//                             children: [
//                               CustomUi.gkBox('Static GK', 'static.png'),
//                               SizedBox(
//                                 width: he * 0.01,
//                               ),
//                               CustomUi.gkBox('Social Science', 'social.png'),
//                               SizedBox(
//                                 width: he * 0.01,
//                               ),
//                               CustomUi.gkBox('Hindi', 'hindi.png'),
//                             ],
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(top: he * 0.02),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                                 height: 45,
//                                 width: he * 0.3,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Pallete.blueGradient1,
//                                         Pallete.blueGradient2
//                                       ],
//                                       begin: Alignment.bottomLeft,
//                                       end: Alignment.topRight,
//                                     ),
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.transparent,
//                                       shadowColor: Colors.transparent),
//                                   child: const Text('More',
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         color: Colors.white,
//                                       )),
//                                 )),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsets.only(left: he * 0.02, top: he * 0.02),
//                         child: CustomUi.homeHeading('QUIZ TEST'),
//                       ),
//                       Padding(
//                           padding:
//                               EdgeInsets.only(left: he * 0.02, top: he * 0.01),
//                           child: Row(
//                             children: [
//                               CustomUi.quizBox('Current Affairs'),
//                               SizedBox(
//                                 width: he * 0.03,
//                               ),
//                               CustomUi.quizBox('GK Quiz'),
//                             ],
//                           )),
//                     ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// AppBar _appBar(BuildContext context) {
//   return AppBar(
//     backgroundColor: Pallete.blueDarkColor,
//     title: const Text(
//       'User Name',
//       style: TextStyle(color: Colors.white),
//     ),
//     leading: Builder(builder: (context) {
//       return IconButton(
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//           icon: const Icon(
//             Icons.menu,
//             size: 30,
//             color: Colors.white,
//           ));
//     }),
//     actions: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(right: 10.0),
//         child: Container(
//             height: 45,
//             width: 45,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(20)),
//             child: Image.asset("assets/images/user.png")),
//       )
//     ],
//   );
// }
