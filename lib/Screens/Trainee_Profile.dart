// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element
import 'package:flutter/material.dart';

class TraineeProfile extends StatefulWidget {
  const TraineeProfile({super.key});

  @override
  State<TraineeProfile> createState() => _TraineeProfileState();
}

class _TraineeProfileState extends State<TraineeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

  Widget _Card(String URL) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            InkWell(
              child: Image.asset(URL),
              onDoubleTap: () => {},
            ),
          ],
        ),
      ),
    );
  }