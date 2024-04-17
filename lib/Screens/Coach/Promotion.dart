// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Widgets/Coach_Appbar.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'package:provider/provider.dart';

class Promotion extends StatefulWidget {
  const Promotion({super.key});

  @override
  State<Promotion> createState() => _PromotionState();
}
// Model class for Grade

class _PromotionState extends State<Promotion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoachAppbar(),
      bottomNavigationBar: Coach_Navbar_Widget(),
      body: Consumer<Model>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      '${value.grades[index].gradeName}',
                      style: TextStyle(color: blueHex, fontSize: 25),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            value.toggleTraineePromotion(index, false);
                            //print("${  value.totalGrade}");
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                        Container(
                          //padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                          child: TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              '${value.grades[index].gradeValue}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),

                          //  Text(
                          //   '${value.grades[index].gradeValue}',
                          //   style: TextStyle(color: Colors.white, fontSize: 25),
                          // ),
                        ),
                        IconButton(
                          onPressed: () {
                            value.toggleTraineePromotion(index, true);
                          },
                          icon: Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  value.calculateTotalGrade();
                  print("${value.grades}");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            value.totalGrade > 70 ? Colors.green : Colors.red,
                        title: Text("Total Grade"),
                        content: Text(
                          "Total Grade: ${value.totalGrade} / 100",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Calculate"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _Grade(Model grade) {
  //   return Expanded(
  //     child: Row(
  //       children: [

  //         Expanded(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   '${grade.grades[index].gradeName}',
  //                   style: TextStyle(color: blueHex, fontSize: 25),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           grade.gradeValue--;
  //                         });
  //                       },
  //                       icon: Icon(
  //                         Icons.remove,
  //                         size: 20,
  //                         color: Color(0xff000000),
  //                       ),
  //                     ),
  //                     Container(
  //                       padding: EdgeInsets.all(9),
  //                       decoration: BoxDecoration(
  //                         color: Color(0xffD9D9D9),
  //                         borderRadius: BorderRadius.all(Radius.circular(23)),
  //                         //border: Border.all(width: 2)
  //                       ),
  //                       child: Text(
  //                         '${grade.gradeValue}',
  //                         style: TextStyle(color: Colors.white, fontSize: 25),
  //                       ),
  //                     ),
  //                     IconButton(
  //                       onPressed: () {
  //                         setState(() {
  //                           if (grade.gradeValue < 10) {
  //                             grade.gradeValue++;
  //                           }
  //                         });
  //                       },
  //                       icon: Icon(
  //                         Icons.add,
  //                         size: 20,
  //                         color: Color(0xff000000),
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),

  //       ],
  //     ),
  //   );
  // }
}
