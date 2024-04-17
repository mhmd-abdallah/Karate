// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:karate/Screens/Coach/Promotion.dart';
import 'package:karate/Screens/Trainee/Trainee_Edit_Screen.dart';
import 'package:karate/Widgets/Coach_Appbar.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';

class CoachViewProfile extends StatefulWidget {
  const CoachViewProfile({Key? key});

  @override
  State<CoachViewProfile> createState() => _CoachViewProfileState();
}

class _CoachViewProfileState extends State<CoachViewProfile> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoachAppbar(),
      bottomNavigationBar: Coach_Navbar_Widget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/icons/profile-appbar.png",
                height: 100,
                width: 100,
              ),
              Text(
                "Ali Abdallah",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)),
              ),
              Text(
                "White Belt",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff999999)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "P.S.E",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000)),
                  ),
                  Container(
                    height: 7,
                    width: 250,
                    child: LinearProgressIndicator(
                      value: isChecked ? 1.0 : 0.0,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffB53847)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _RowCard("assets/icons/telephone.png", "81847663",
                      Color(0xff967CFD)),
                  _RowCard("assets/icons/weighing-machine.png", "88 kg",
                      Color(0xffFFBF1A)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Uploaded Videos",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
              _Card("assets/icons/kata.png", "Pinam Sono Ichi"),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: [
                      ElevatedButton(
                     style     : ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff414141)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(253.0),
                        ),
                        
                      ),
                    ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Promotion()),
                          )
                        },
                        child: Image.asset("assets/icons/Vector.png",fit: BoxFit.fill,),
                        // elevation: 0,
                        // backgroundColor: Color(0xff333333),
                      ),
                      Text(
                        "Promote",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 19),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Card(String URL, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _RowCard(String URL, String text, Color colorbg) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorbg,
                image: DecorationImage(
                    image: AssetImage(URL), fit: BoxFit.contain),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
