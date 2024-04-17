// ignore_for_file: prefer_const_constructors, unused_import, camel_case_types, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Screens/Trainee/Trainee_Home.dart';
import 'package:karate/Screens/Trainee/Trainee_PSE.dart';
import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
import 'package:karate/Screens/Trainee/Trainee_Upload_Video.dart';
import 'package:karate/Screens/Trainee/Trainee_Tasks.dart';
import 'package:karate/Screens/Trainee/Trainee_Edit_Screen.dart';

class Trainee_Navbar_Widget extends StatefulWidget {
  const Trainee_Navbar_Widget({Key? key}) : super(key: key);

  @override
  _Trainee_Navbar_WidgetState createState() => _Trainee_Navbar_WidgetState();
}

class _Trainee_Navbar_WidgetState extends State<Trainee_Navbar_Widget> {
  int _currentIndex = 2; // Set the default index to 2 (TraineeHome)


  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: redHex,
      buttonBackgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      height: 75,
      index: _currentIndex,
      
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        GestureDetector(
            onTap: () => _onItemTapped(0),
            child: Icon(
              Icons.sports_kabaddi_rounded,

            )),
        GestureDetector(
            onTap: () => _onItemTapped(1),
            child: Icon(Icons.camera_alt_rounded,)),
        GestureDetector(
            onTap: () => _onItemTapped(2),
            child: Icon(Icons.dashboard_rounded)),
        GestureDetector(
            onTap: () => _onItemTapped(3), child: Icon(Icons.task_alt_sharp)),
        GestureDetector(
            onTap: () => _onItemTapped(4), child: Icon(Icons.person_2)),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

      _navigateToScreen(index);
    });
  }

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Trainee_PSE()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UploadVideo()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TraineeHome()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TraineeTasks()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TraineeProfile()),
        );
        break;
    }
  }
}
