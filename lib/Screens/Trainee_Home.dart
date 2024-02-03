// ignore_for_file: prefer_const_constructors, file_names, unused_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Screens/Trainee_PSE.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/app_bar_widget.dart';

class TraineeHome extends StatefulWidget {
  const TraineeHome({super.key});

  @override
  State<TraineeHome> createState() => _TraineeHomeState();
}

class _TraineeHomeState extends State<TraineeHome> {
  bool isChecked = true;

  bool isPushUps = false;
  bool isSquats = false;
  bool isSitUps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 560,
              padding: EdgeInsets.all(6),
              height: 112,
              decoration: BoxDecoration(color: Color(0xFFDAD2D2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Push ups',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        child: LinearProgressIndicator(
                          value: isPushUps ? 1.0 : 0.0,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff5BB6AF)),
                        ),
                      ),
                      Text(
                        isPushUps ? 'Done' : "0% ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5BB6AF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sit ups',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        child: LinearProgressIndicator(
                          value: isSitUps ? 1.0 : 0.0,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffF2B455)),
                        ),
                      ),
                      Text(
                        isSitUps ? 'Done' : "0% ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffF2B455),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Squats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 100,
                        child: LinearProgressIndicator(
                          value: isSquats ? 1.0 : 0.0,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xffB53847)),
                        ),
                      ),
                      Text(
                        isSquats ? 'Done' : "0% ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffB53847),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Checkbox(
            //   value: isChecked,
            //   onChanged: (value) {
            //     setState(() {
            //       isChecked = value ?? false;
            //     });
            //   },
            // ),
            Text(
              "Kata",
              style: TextStyle(
                color: Color(0xff9098A3),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
    // Navigate to Trainee_PSE with checkbox states
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Trainee_PSE(
          onProgressChanged: updateProgress,
          initialPushUpsState: isPushUps,
          initialSitUpsState: isSitUps,
          initialSquatsState: isSquats,
        ),
      ),
    );
  },
  child: Text("Go to Trainee_PSE"),
)

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
              onDoubleTap: () => {},
            ),
          ],
        ),
      ),
    );
  }

  void updateProgress(bool PushUps, bool SitUps, bool Squats) {
    setState(() {
      isPushUps = PushUps;
      isSitUps = SitUps;
      isSquats = Squats;
    });
  }
}
