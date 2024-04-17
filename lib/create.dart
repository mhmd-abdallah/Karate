// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, unused_local_variable,, avoid_web_libraries_in_flutter, use_build_context_synchronously, non_constant_identifier_names, must_be_immutable, prefer_const_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:karate/HomePage.dart';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  Map? itemData;
  CreatePage({super.key, this.itemData});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Task Title'),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: titleCon,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Task Descrirption'),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: descriptionCon,
              ),
              CategoryDrop(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder()),
                        onPressed: () {
                          //Navigator.push(context,MaterialPageRoute( builder: (context) => HomePage(), ));
                          setState(() {
                            isEdit ? updateData() : postData();
                          });
                        },
                        child: Text(isEdit ? 'Update Task' : 'Create Task')),
                  ),
                ],
              )
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
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Something Error'),
        backgroundColor: Colors.red,
      ));
    }
  }

//put
  Future<void> updateData() async {
    final id = widget.itemData!['_id'];
    final body = {
      "title": titleCon.text,
      "description": descriptionCon.text,
      "is_completed": "false"
    };

    final url = Uri.parse("https://api.nstack.in/v1/todos/$id");
    final response = await http.put(
      url,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
         print('Response Code: ${response.statusCode}');
  print('Response Body: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Updated'),
        backgroundColor: Colors.green,
      ));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomePage()),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Something Error'),
        backgroundColor: Colors.red,
      ));
    }
  }

/*
Widget inputText(TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(border: OutlineInputBorder()),
  );
}
*/
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
