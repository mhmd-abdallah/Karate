// ignore_for_file: unused_import, file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import '../widgets/inputText.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController FnameCon = TextEditingController();
TextEditingController LnameCon = TextEditingController();
TextEditingController passwordCon = TextEditingController();
TextEditingController WeightCon = TextEditingController();
TextEditingController BeltCon = TextEditingController();
TextEditingController PhoneCon = TextEditingController();
TextEditingController DobCon = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/signup-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                inputText(
                    hintText: 'First Name',
                    controller: FnameCon, preficon: null,
                  ),
                inputText(
                    hintText: 'Last Name',
                    controller: LnameCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Weight',
                    controller: WeightCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Phone Number',
                    controller: PhoneCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Belt',
                    controller: BeltCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Date Of Birth',
                    controller: DobCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Password',
                    controller: passwordCon, preficon: null,
                  ),
                   inputText(
                    hintText: 'Confirm Password',
                    controller: null, preficon: null,
                  ),
                    
                _SignUpBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _SignUpBtn() {
  return Container(
      child: ElevatedButton(
    onPressed: () {
      //   Navigator.push(context,MaterialPageRoute(builder: (context)=> HomeScreen()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 90,
        vertical: 19,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  ));
}
