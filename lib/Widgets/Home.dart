// ignore_for_file: file_names
// // ignore_for_file: file_names, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:karate/Constants/Colors.dart';
// import 'package:karate/Screens/Login.dart';
// import 'package:karate/Screens/Trainee/Trainee_Home.dart';
// import 'package:karate/Screens/Trainee/Trainee_PSE.dart';
// import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
// import 'package:karate/Screens/Trainee/Trainee_Tasks.dart';
// import 'package:karate/Screens/Trainee/Trainee_Upload_Video.dart';
// import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
// import 'package:karate/Widgets/app_bar_widget.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   // final items = const [
//   //   Icon(
//   //     Icons.sports_kabaddi_rounded,
//   //     size: 30,
//   //   ),
//   //   Icon(
//   //     Icons.camera_alt_rounded,
//   //     size: 30,
//   //   ),
//   //   Icon(
//   //     Icons.dashboard_rounded,
//   //     size: 30,
//   //   ),
//   //   Icon(
//   //     Icons.task_alt_sharp,
//   //     size: 30,
//   //   ),
//   //   Icon(
//   //     Icons.person_2,
//   //     size: 30,
//   //   )
//   // ];

//   int index = 2;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         appBar: AppBarWidget(),
        

//         bottomNavigationBar: CurvedNavigationBar(
//           //buttonBackgroundColor: Colors.blue,
//           color: redHex,
//           items: [
//             Icon(
//               Icons.sports_kabaddi_rounded,
//               size: 30,
//             ),
//             Icon(
//               Icons.camera_alt_rounded,
//               size: 30,
//             ),
//             Icon(
//               Icons.dashboard_rounded,
//               size: 30,
//             ),
//             Icon(
//               Icons.task_alt_sharp,
//               size: 30,
//             ),
//             Icon(
//               Icons.person_2,
//               size: 30,
//             )
//           ],
//           index: index,
//           onTap: (selctedIndex) {
//             setState(() {
//               index = selctedIndex;
//             });
//           },
//           height: 70,
//           backgroundColor: Color(0xffF7F8F3),
//           animationDuration: const Duration(milliseconds: 300),
//           // animationCurve: ,
//         ),
       
//         body: getSelectedWidget(index: index),
//       ),
//     );
//   }

//   Widget getSelectedWidget({required int index}) {
//     Widget widget;
//     switch (index) {
//       case 0:
//         widget = const Trainee_PSE();
//         break;
//       case 1:
//         widget = const UploadVideo();
//         break;
//       case 2:
//         widget = const TraineeHome();
//         break;
//       case 3:
//         widget = const TraineeTasks();
//         break;
//       default:
//         widget = const TraineeProfile();
//         break;
//     }
//     return widget;
//   }
// }
