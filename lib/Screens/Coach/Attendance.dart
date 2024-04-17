// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_import, unused_element, sort_child_properties_last, use_key_in_widget_constructors, duplicate_import, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, library_private_types_in_public_api, avoid_print
import 'package:flutter/material.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Model/TraineeStatus.dart';
import 'package:karate/Screens/Coach/Coach_Home.dart';
import 'package:karate/Widgets/Coach_Appbar.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:provider/provider.dart';

class Attendance extends StatefulWidget {
  //final List<Trainees> trainees;

  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoachAppbar(),
      bottomNavigationBar: Coach_Navbar_Widget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("Attendance"),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("Performance"),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("Task        "),
                  ],
                ),
              ],
            ),
         
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Consumer<Model>(
                  builder: (context, model, child) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(model.ListOfTrainees[index].URL),
                    ),
                    title: Text(model.ListOfTrainees[index].name),
                    subtitle: Text(model.ListOfTrainees[index].belt),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.toggleTraineeCheckbox(index);
                          },
                          child: Checkbox(
                            value: model.ListOfTrainees[index].isChecked,
                            onChanged: (value) {
                              model.toggleTraineeCheckbox(index);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                model.toggleTraineePerformance(index, false);
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${model.ListOfTrainees[index].performance}',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                model.toggleTraineePerformance(index, true);
                              },
                              icon: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
         
          ],
        ),
      ),
    );
  }
}
