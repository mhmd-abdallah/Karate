// ignore_for_file: file_names, prefer_const_constructors, unused_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karate/Screens/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: Center(child: Image.asset('assets/icons/welcome.png',width: 500,))),
    );
  }
}
