// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 208, 208),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset(
                    'assets/icons/login-bg.png',
                    width: 330,
                    height: 330,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              inputText(
                'Username',
                passwordCon,
                preficon: Icon(Icons.person),
              ),
              SizedBox(
                height: 20,
              ),
              inputText('Password', emailCon,
                  preficon: Icon(Icons.lock),
                  sufIcon: Icon(Icons.remove_red_eye_outlined)),
              SizedBox(
                height: 20,
              ),
              _loginBtn(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 18, color: Color(0xff202020)),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 103, 100, 100),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sing up",
                      style: TextStyle(fontSize: 18, color: Color(0xff202020)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _loginBtn() {
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
            'Login',
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

Widget inputText(String hintText, TextEditingController controller,
    {Icon? preficon, Icon? sufIcon}) {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromARGB(247, 92, 92, 92)));

  return TextField(
    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      enabledBorder: border,
      prefixIcon: preficon,
      suffixIcon: sufIcon,
      focusedBorder: border,
    ),
  );
}
