// ignore_for_file: prefer_const_constructors, unused_label, unused_import, non_constant_identifier_names, unused_element, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:karate/Model/Model.dart';
import 'package:karate/Model/Trainees.dart';
import 'package:karate/Screens/Coach/Attendance.dart';
import 'package:karate/Widgets/Coach_Appbar.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';
import 'package:provider/provider.dart';

class CoachHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoachAppbar(),
      bottomNavigationBar: Coach_Navbar_Widget(),
      body: Consumer<Model>(
        builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: model.ListOfTrainees.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.ListOfTrainees[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(model.ListOfTrainees[index].belt),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            model.remove(model.ListOfTrainees[index]);
                          },
                          icon: Icon(Icons.attachment_rounded),
                        ),
                        leading: Image.asset(model.ListOfTrainees[index].URL),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String name = '';
                      String belt = '';
                      String URL = '';
                      return AlertDialog(
                        title: Text('Add Trainee'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              onChanged: (value) => name = value,
                              decoration: InputDecoration(labelText: 'Name'),
                            ),
                            TextField(
                              onChanged: (value) => belt = value,
                              decoration: InputDecoration(labelText: 'Belt'),
                            ),
                            TextField(
                              onChanged: (value) => URL = value,
                              decoration: InputDecoration(labelText: 'URL'),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              model.addATrainee(name, belt, URL);
                              Navigator.of(context).pop();
                            },
                            child: Text('Add',style: TextStyle(color: Colors.amber),),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add Trainee'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Attendance()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Take Attendance",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff414141)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.mode_edit_outlined,
                            color: Color(0xff303354)),
                        SizedBox(width: 8),
                        Text(
                          "Edit Attendance",
                          style: TextStyle(color: Color(0xff303354)),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffB6B6B6)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),

      //  SingleChildScrollView(
      //   child: Column(
      //     children: List.generate(trainees.length, (index) {
      //       return Consumer<Model>(builder: (context, value, child) => _Trainee(),)

      //       // _Trainee(trainees[index].name, trainees[index].belt,
      //       //     trainees[index].URL);
      //     }),
      //   ),
      // ),
    );
  }

  Widget _Trainee(String name, String beltColor, String URL) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            URL,
            height: 90, // Adjust the height as needed
          ),
        ),
        Expanded(
          child: Title(
            color: Colors.white,
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                children: [
                  TextSpan(
                    text: '$name\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '$beltColor',
                  ),
                ],
              ),
            ),
          ),
        ),
        Icon(Icons.fitness_center)
      ],
    );
  }
}
