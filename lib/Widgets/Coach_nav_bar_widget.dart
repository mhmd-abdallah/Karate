// ignore_for_file: prefer_const_constructors, use_super_parameters, unused_import, avoid_print, prefer_const_literals_to_create_immutables, camel_case_types, file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:karate/Screens/Coach/Coach_Home.dart';
import 'package:karate/Screens/Coach/Coach_Upload_Video.dart';

import '../Constants/Colors.dart';

class Coach_Navbar_Widget extends StatelessWidget {
  const Coach_Navbar_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      //height: 50,
      color: blueHex,
      buttonBackgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 400),
      backgroundColor: Colors.transparent,
      items: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoachHome(),
                ));
          },
          child: Icon(Icons.sports_kabaddi_rounded),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoachUploadVideo(),
                ));
          },
          child: Icon(Icons.camera_alt_rounded),
        ),
      ],
    );
  }
}
