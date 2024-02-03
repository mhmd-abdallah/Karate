// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/app_bar_widget.dart';

class TraineeConstants extends StatelessWidget {
  const TraineeConstants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
    );
  }
}