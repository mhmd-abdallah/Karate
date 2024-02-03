// ignore_for_file: prefer_const_constructors, unused_label, unused_import

import 'package:flutter/material.dart';
import 'package:karate/Screens/Dashboard.dart';
import 'package:karate/Screens/Slider.dart';
import 'package:karate/Screens/Trainee_Home.dart';
import 'package:karate/Screens/Trainee_PSE.dart';
import 'package:karate/Screens/Trainee_Profile.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/app_bar_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      

      home:TraineeHome(),
    );
  }
}
