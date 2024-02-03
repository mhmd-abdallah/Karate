// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Screens/Trainee_Home.dart';
import 'package:karate/Screens/Trainee_Profile.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/app_bar_widget.dart';

class Trainee_PSE extends StatefulWidget {
  const Trainee_PSE({super.key, required this.onProgressChanged ,required this.initialPushUpsState,
    required this.initialSitUpsState,
    required this.initialSquatsState,});
  //final Function(bool isPushUps, bool isSitUps, bool isSquats) onProgressChanged;
final Function(bool, bool, bool) onProgressChanged;
  final bool initialPushUpsState;
  final bool initialSitUpsState;
  final bool initialSquatsState;
  @override
  State<Trainee_PSE> createState() => _Trainee_PSEState();
}

class _Trainee_PSEState extends State<Trainee_PSE> {
  bool isPushUps = false;
  bool isSquats = false;
  bool isSitUps = false;

  @override
  void initState() {
    super.initState();
    // Initialize the state with the received initial states
    isPushUps = widget.initialPushUpsState;
    isSitUps = widget.initialSitUpsState;
    isSquats = widget.initialSquatsState;
      //  widget.onProgressChanged(isPushUps, isSquats, isSitUps);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '\nDaily Physical \nStrength Exercises\n',
            style: TextStyle(
              fontSize: 46,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pushups :    15 ",
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                ),
              ),
              customCheckbox(isPushUps, (value) {
                setState(() {
                  isPushUps = value;
                  widget.onProgressChanged(isPushUps, isSquats, isSitUps); // Moved here
                });
              }),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Squats :    15 ",
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                ),
              ),
              customCheckbox(isSquats, (value) {
                setState(() {
                  isSquats = value;
                  widget.onProgressChanged(isPushUps, isSquats, isSitUps); // Moved here
                });
              }),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sit ups :    15 ",
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                ),
              ),
              customCheckbox(isSitUps, (value) {
                setState(() {
                  isSitUps = value;
                  widget.onProgressChanged(isPushUps, isSquats, isSitUps); // Moved here
                });
              }),
            ],
          ),
          ElevatedButton(
  onPressed: () {
    // Navigate to Trainee_PSE when the button is pressed
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TraineeHome(),
      ),
    );
  },
  child: Text("Go to Trainee_PSE"),
)
        ],
      ),
    );
  }

  Widget customCheckbox(bool isChecked, ValueChanged<bool> onChanged) {
    return InkWell(
      onTap: () {
        onChanged(!isChecked); // Call the provided callback
      },
      child: Container(
        width: 30, // Adjust width as needed
        height: 30, // Adjust height as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey, // Adjust border color as needed
            width: 2, // Adjust border width as needed
          ),
          color: isChecked ? redHex : Colors.transparent,
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white, // Adjust checkmark color as needed
              )
            : null,
      ),
    );
  }
}
