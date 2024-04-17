// ignore_for_file: file_names, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:karate/Widgets/Home.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';

class TraineeKata extends StatelessWidget {
  const TraineeKata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
    );
  }
}
