// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print, unused_label, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karate/create.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  List mydata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('To Do Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
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
                GestureDetector(child: Text("See All"),onTap: () {
                  
                },),
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
                                  //deleteById(data["_id"]);
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
     
      ),
    );
  }

//create
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
  }

//delete
  deleteById(String id) async {
    final url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.delete(url);
    fetchData();
  }
}
