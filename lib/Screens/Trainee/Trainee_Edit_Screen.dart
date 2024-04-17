// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:karate/Screens/Trainee/Trainee_Profile.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      //   bottomNavigationBar: Trainee_Navbar_Widget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _inputField(
              ("Phone Number"),
            ),
            SizedBox(
              height: 10,
            ),
            _inputField("Weight"),
            SizedBox(
              height: 10,
            ),
            _inputField("Password"),
            SizedBox(
              height: 10,
            ),
            _inputField("Confirm Password", sfIcon: Icon(Icons.lock)),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 150,
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TraineeProfile(),
                    ),
                  )
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}

Widget _inputField(String hintText, {Icon? sfIcon, bool isPassword = false}) {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromARGB(247, 92, 92, 92)));

  return TextField(
    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    //controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      //hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      enabledBorder: border,
      focusedBorder: border,
      suffixIcon: sfIcon,
    ),
    obscureText: isPassword,
  );
}
