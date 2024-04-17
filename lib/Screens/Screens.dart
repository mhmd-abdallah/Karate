// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Screens/Coach/Coach_Home.dart';
import 'package:karate/Screens/Coach/Coach_Upload_Video.dart';
import 'package:karate/Screens/Coach/Coach_View_Profile.dart';
import 'package:karate/Screens/Coach/Promotion.dart';
import 'package:karate/Screens/Coach/Weakness_Task.dart';
import 'package:karate/Screens/Trainee/Trainee_Edit_Screen.dart';
import 'package:karate/Screens/Trainee/Trainee_Home.dart';
import 'package:karate/Screens/Trainee/Trainee_PSE.dart';
import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
import 'package:karate/Screens/Trainee/Trainee_Tasks.dart';
import 'package:karate/Screens/Trainee/Trainee_Upload_Video.dart';

class Screens extends StatelessWidget {
  const Screens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Row(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: redHex,child: Text("Trainee"),),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TraineeHome(),
              ),
            ),
            child: Text("TraineeHome"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TraineeProfile(),
              ),
            ),
            child: Text("TraineeProfile"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UploadVideo(),
              ),
            ),
            child: Text("Trainee_Upload_Video"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Trainee_PSE(),
              ),
            ),
            child: Text("Trainee_PSE"),
          ),
           ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditScreen(),
              ),
            ),
            child: Text("EditScreen"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TraineeTasks(),
              ),
            ),
            child: Text("TraineeTasks"),
          ),
        ],
      ),

       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(color: redHex,child: Text("Coach"),),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoachHome(),
              ),
            ),
            child: Text("CoachHome"),
          ),
          // ElevatedButton(
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => Attendance(),
          //     ),
          //   ),
          //   child: Text("Attendance"),
          // ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoachUploadVideo(),
              ),
            ),
            child: Text("Coach_Upload_Video"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CoachViewProfile(),
              ),
            ),
            child: Text("CoachViewProfile"),
          ),
           ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Promotion(),
              ),
            ),
            child: Text("Promotion"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeaknessTask(),
              ),
            ),
            child: Text("WeaknessTask"),
          ),
        ],
      ),
    
    ],
  ),
);

  }
}
