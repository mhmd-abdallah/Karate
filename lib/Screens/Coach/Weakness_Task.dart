// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, unused_local_variable,, avoid_web_libraries_in_flutter, use_build_context_synchronously, non_constant_identifier_names, must_be_immutable, prefer_const_declarations, file_names, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karate/HomePage.dart';
import 'package:http/http.dart' as http;
import 'package:karate/Screens/Trainee/Trainee_Tasks.dart';
import 'package:karate/Widgets/Coach_nav_bar_widget.dart';

import '../../Widgets/Coach_Appbar.dart';

class WeaknessTask extends StatefulWidget {
  Map? itemData;
  WeaknessTask({super.key, this.itemData});

  @override
  State<WeaknessTask> createState() => _WeaknessTaskState();
}

class _WeaknessTaskState extends State<WeaknessTask> {
  TextEditingController titleCon = TextEditingController();
  TextEditingController descriptionCon = TextEditingController();
  String? selectedCategory;

  bool isEdit = false;

  @override
  void initState() {
    final data = widget.itemData;
    if (widget.itemData != null) {
      isEdit = true;
      titleCon.text = data!['title'];
      descriptionCon.text = data['description'];
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoachAppbar(),
      bottomNavigationBar: Coach_Navbar_Widget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      children: [
                        TextSpan(
                          text: 'Assign a \n',
                          style: TextStyle(fontSize: 42),
                        ),
                        TextSpan(
                          text: 'Weakness\n',
                          style: TextStyle(fontSize: 42),
                        ),
                        TextSpan(
                          text: 'Task',
                          style: TextStyle(fontSize: 42),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: FloatingActionButton(
                        onPressed: () => {},
                        child: Icon(
                          Icons.refresh,
                          size: 40,
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      )),
                ],
              ),
              CategoryDrop(),
               TextField(
               
                controller: descriptionCon,
              ),
              SizedBox(
                height: 20,
              ),
             
              
             
              SizedBox(
                height: 20,
              ),
              // MaterialButton(
              //    onPressed: () {
                       
              //             setState(() {
              //                postData();
              //             });
              //           },
              //   child: Text(
              //     "Assign",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   color: Color(0xff858585),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10.0),
              //   ),
              //   height: 50.0, // Adjust the height as needed
              //   minWidth: 50.0, // Adjust the width as needed
              // )
              ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder()),
                        onPressed: () {
                          //Navigator.push(context,MaterialPageRoute( builder: (context) => HomePage(), ));
                          setState(() {
                             postData();
                          });
                        },
                        child: Text( 'Create Task')),
            ],
          ),
        ),
      ),
    );
  }


  // post
  Future<void> postData() async {
    if (selectedCategory == null) {
      // Handle case where no category is selected
      print('not created====================');
      return;
    }

    final body = {
      "title": selectedCategory!,
      "description": descriptionCon.text,
      "is_completed": "false"
    };

    var url = Uri.parse("https://api.nstack.in/v1/todos");
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    // Check the status code
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Created'),
        backgroundColor: Colors.green,
      ));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TraineeTasks()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Something Error'),
        backgroundColor: Colors.red,
      ));
    }
  }


  Widget CategoryDrop() {
    List<String> categories = [
      "Kata",
      "Physical Strength Exercises",
      "Techniques"
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  hintText: "Name",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(247, 92, 92, 92)),
                  ),
                ),
                items: categories.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedCategory = value; // Update the selected category
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down_sharp),
                iconSize: 24,
                isExpanded: true,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            if (categories.isNotEmpty) // Check if the list is not empty
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    // Remove the dropdown field
                    categories.removeAt(categories.length - 1);
                  });
                },
              ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              // Handle add icon press by adding a new dropdown field
              categories.add("New Category");
            });
          },
        ),
      ],
    );
  }


}
