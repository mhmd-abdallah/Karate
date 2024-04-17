// ignore_for_file: prefer_const_constructors, unused_label, unused_import

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Screens/Coach/Attendance.dart';
import 'package:karate/Screens/Coach/Coach_Home.dart';
import 'package:karate/Screens/Coach/Coach_Upload_Video.dart';
import 'package:karate/Screens/Coach/Coach_View_Profile.dart';
import 'package:karate/Screens/Coach/Promotion.dart';
import 'package:karate/Screens/Coach/Weakness_Task.dart';
import 'package:karate/Widgets/Home.dart';
import 'package:karate/Screens/Login.dart';
import 'package:karate/Screens/Screens.dart';
import 'package:karate/Screens/Trainee/Trainee_Edit_Screen.dart';
import 'package:karate/Screens/Trainee/Trainee_Home.dart';
import 'package:karate/Screens/Trainee/Trainee_PSE.dart';
import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
import 'package:karate/Screens/Trainee/Trainee_Tasks.dart';
import 'package:karate/Screens/Trainee/Trainee_Upload_Video.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'package:karate/create.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (context) {
        //return Cart();
        return Model();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Promotion(),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Screens(),
    // );
  }
}
