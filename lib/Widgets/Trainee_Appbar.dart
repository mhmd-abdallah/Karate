// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:karate/Constants/Colors.dart';

class TraineeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TraineeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: AppBar(
        backgroundColor: redHex,
        actions: <Widget>[
          
          SizedBox(
            width: 20,
          ),
          Container(
            color: redHex,
            
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/icons/profile-appbar.png',
              height: 120, 
            ),
          ),
          Expanded(
            child: Center(
              child: Title(
                color: Colors.white,
                child: Text(
                  'Mohammad Abdallah \n        White Belt',
                  style: TextStyle(color: Colors.white,fontSize: 20),
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
