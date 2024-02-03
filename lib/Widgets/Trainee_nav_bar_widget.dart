// ignore_for_file: prefer_const_constructors, use_super_parameters, unused_import, avoid_print, prefer_const_literals_to_create_immutables, camel_case_types, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karate/Screens/Trainee_Home.dart';
import 'package:karate/Screens/Trainee_PSE.dart';
import 'package:karate/Screens/Trainee_Profile.dart';

import '../Constants/Colors.dart';

class Trainee_Navbar_Widget extends StatelessWidget {
  const Trainee_Navbar_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      //height: 50,
      color: redHex,
      buttonBackgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 400),
      backgroundColor: Colors.transparent,
      items: [
        GestureDetector(
            onTap: () => {}, child: Icon(Icons.sports_kabaddi_rounded)),
        GestureDetector(
            onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Trainee_PSE()),
                  // )
                },
            child: Icon(Icons.camera_alt_rounded)),
        GestureDetector(onTap: () => { Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TraineeHome()),
                  )}, child: Icon(Icons.dashboard_rounded)),
        GestureDetector(onTap: () => {}, child: Icon(Icons.task_alt_sharp)),
        GestureDetector(onTap: () => {}, child: Icon(Icons.person_2)),
      ],
    );
  }
}
