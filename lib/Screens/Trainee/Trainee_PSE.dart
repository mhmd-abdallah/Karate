// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Screens/Trainee/Trainee_Home.dart';
import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'package:provider/provider.dart';

class Trainee_PSE extends StatefulWidget {
  const Trainee_PSE({
    super.key,
  });

  @override
  State<Trainee_PSE> createState() => _Trainee_PSEState();
}

class _Trainee_PSEState extends State<Trainee_PSE> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body:

      
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\nDaily Physical \nStrength Exercises\n',
                style: TextStyle(
                  fontSize: 43,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Consumer<Model>(
            builder: (context, model, child) => GestureDetector(
              child: Checkbox(
                value: model.isPushUps,
                onChanged: (newValue) {
                  model.togglePushups();
                },
              ),
            ),
          ),
          
              Text(
                "Pushups :   15 ",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Consumer<Model>(
            builder: (context, model, child) => GestureDetector(
              child: Checkbox(
                value: model.isSquats,
                onChanged: (newValue) {
                  model.toggleSquats();
                },
              ),
            ),
          ),
          
              Text(
                "Squats :    15 ",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Consumer<Model>(
            builder: (context, model, child) => GestureDetector(
              child: Checkbox(
                value: model.isSitUps,
                onChanged: (newValue) {
                  model.toggleSitups();
                },
              ),
            ),
          ),
       
              Text(
                "Sit ups :    15 ",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TraineeHome(),
                ),
              );
            },
            child: Text("Go to Trainee_PSE"),
          ),
          
        ],
      ),

    
    
    );
  }

  Widget customCheckbox(bool isChecked, ValueChanged<bool> onChanged) {
    return InkWell(
      onTap: () {
        onChanged(!isChecked);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          color: isChecked ? redHex : Colors.transparent,
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
