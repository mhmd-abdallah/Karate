// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget inputText(
    { hintText,
     controller,
    Icon? preficon,
    Icon? sufIcon}) {
  var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color.fromARGB(247, 92, 92, 92)));

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: border,
        focusedBorder: border,
        prefixIcon: preficon,
        suffixIcon: sufIcon,
      ),
    ),
  );
}
