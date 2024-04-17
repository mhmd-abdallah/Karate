// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';

class CoachAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CoachAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: AppBar(
        backgroundColor: blueHex,
        actions: <Widget>[
          
          SizedBox(
            width: 20,
          ),
          Container(
            color: blueHex,
            
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/icons/profile-appbar.png',
              height: 90, // Adjust the height as needed
            ),
          ),
          Expanded(
            child: Center(
              child: Title(
                color: Colors.white,
                child: Text(
                  'Mohammad Abdallah \n        Black Belt',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
