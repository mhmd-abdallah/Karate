// ignore_for_file: prefer_const_constructors, file_names, unused_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Network_player_widget.dart';
import 'package:karate/Screens/Trainee/Trainee_Kata.dart';
import 'package:karate/Screens/Trainee/Trainee_PSE.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'package:karate/asset.dart';
import 'package:karate/file_player_widget.dart';
import 'package:provider/provider.dart';

class TraineeHome extends StatefulWidget {
  const TraineeHome({super.key});

  @override
  State<TraineeHome> createState() => _TraineeHomeState();
}

class _TraineeHomeState extends State<TraineeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 560,
              padding: EdgeInsets.all(6),
              height: 112,
              decoration: BoxDecoration(color: Color(0xFFDAD2D2)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildExerciseProgress('Push ups', Colors.black,
                      Color(0xFF5BB6AF), (model) => model.isPushUps),
                  _buildExerciseProgress('Squats', Colors.black,
                      Color(0xffB53847), (model) => model.isSquats),
                  _buildExerciseProgress('Sit ups', Colors.black,
                      Color(0xffF2B455), (model) => model.isSitUps),
                ],
              ),
            ),
            Text(
              "Kata",
              style: TextStyle(
                color: Color(0xff9098A3),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _Card("assets/icons/kata.png"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Techniques",
              style: TextStyle(
                color: Color(0xff9098A3),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _Card("assets/icons/kata.png"),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Trainee_PSE(),
                  ),
                );
              },
              child: Text("Go to Trainee_PSE"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Card(String URL) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            InkWell(
              child: Image.asset(URL),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => filePlayer(),
                    ))
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseProgress(String exerciseName, Color textColor,
      Color progressColor, bool Function(Model) getValue) {
    return Consumer<Model>(
      builder: (context, model, child) {
        bool isCompleted =
            getValue(model); // Get the value for the current exercise
        return Container(
          width: 180,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black), // Add your border decoration here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                isCompleted ? 'Done' : "0% ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffF2B455),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              LinearProgressIndicator(
                value: isCompleted ? 1.0 : 0.0,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            
            ],
          ),
        );
      },
    );
  }
}
