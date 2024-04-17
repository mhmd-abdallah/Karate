// ignore_for_file: file_names, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:karate/Widgets/Home.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'dart:convert';

import 'package:karate/create.dart';
import 'package:http/http.dart' as http;

class TraineeTasks extends StatefulWidget {
  const TraineeTasks({super.key});

  @override
  State<TraineeTasks> createState() => _TraineeTasksState();
}

class _TraineeTasksState extends State<TraineeTasks> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  List mydata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: fetchData,
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
          Row(
            children: [Text("Today's Tasks")],
          ),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                child: Text("See All"),
                onTap: () {},
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mydata.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = mydata.reversed.toList()[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.blue[50]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              data['title'],
                              style: TextStyle(
                                  fontSize: 20,
                                  decoration: data['is_completed']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                data['description'],
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreatePage(
                                              itemData: data,
                                            )));
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        icon: Icon(Icons.warning),
                                        title: Text("Alert"),
                                        content: Text("Are you sure"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                deleteById(data["_id"]);
                                                Navigator.pop(context);
                                              },
                                              child: Text('Yes')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('No'))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.delete),
                            ),
                            Checkbox(
                                value: data['is_completed'],
                                onChanged: (val) {
                                  check(val!, data['_id'], data['title'],
                                      data['description']);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchData() async {
    var url = Uri.parse("https://api.nstack.in/v1/todos");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      setState(() {
        mydata = json['items'];
      });
      print(mydata);
    } else {}
  }

  //check
  Future<void> check(bool check, String _id, String title, String desc) async {
    final id = _id;
    final body = {"title": title, "description": desc, "is_completed": check};

    final url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.put(
      url,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    fetchData();
    //deleteById(id);
  }

//delete
  deleteById(String id) async {
    final url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.delete(url);
    fetchData();
  }
}
