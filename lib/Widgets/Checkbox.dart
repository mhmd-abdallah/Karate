// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
class CheckboxWidget extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onCheckboxChanged;

  CheckboxWidget({required this.isChecked, required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) => onCheckboxChanged,
    );
  }
}
