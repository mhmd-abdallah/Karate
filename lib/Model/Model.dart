// ignore_for_file: file_names, non_constant_identifier_names, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:karate/Model/Exercises.dart';
import 'package:karate/Model/Grades.dart';
import 'package:karate/Model/Trainees.dart';

class Model extends ChangeNotifier {
  List<Exercises> exercise = [];
  bool isPushUps = false;
  bool isSitUps = false;
  bool isSquats = false;
  bool isChecked = false;
  int totalGrade = 0;
  List<Trainees> trainee = [
    Trainees(
        name: "Mohammad",
        belt: "White belt",
        URL: "assets/icons/profile-appbar.png",
        isChecked: false,
        performance: 0),
    Trainees(
        name: "Mohammad",
        belt: "White belt",
        URL: "assets/icons/profile-appbar.png",
        isChecked: false,
        performance: 0),
    Trainees(
        name: "Mohammad",
        belt: "White belt",
        URL: "assets/icons/profile-appbar.png",
        isChecked: false,
        performance: 0),
    Trainees(
        name: "Mohammad",
        belt: "White belt",
        URL: "assets/icons/profile-appbar.png",
        isChecked: false,
        performance: 0),
    Trainees(
        name: "Mohammad",
        belt: "White belt",
        URL: "assets/icons/profile-appbar.png",
        isChecked: true,
        performance: 0),
  ];
  TextEditingController _controller = TextEditingController();

  List<Grade> grades = [
    Grade(
      gradeName: 'Kata',
      gradeValue: 0,
    ),
    Grade(gradeName: 'Kumite', gradeValue: 0),
    Grade(gradeName: 'Physical strength', gradeValue: 0),
    Grade(gradeName: 'Punches', gradeValue: 0),
    Grade(gradeName: 'Stances', gradeValue: 0),
    Grade(gradeName: 'Blocks', gradeValue: 0),
    Grade(gradeName: 'Kicks', gradeValue: 0),
  ];

  double calculateTotalGrade() {
    //int tot = 0;
    for (int i = 0; i < 7; i++) {
      totalGrade +=   grades[i].gradeValue;
      grades[i].gradeValue=grades[i].gradeValue;
      print("$totalGrade");
    }
    double percentage = (totalGrade / (7 * 10)) * 100;
    
     return double.parse(percentage.toStringAsFixed(1));
  }

  void addTrainee(Trainees tr) {
    trainee.add(tr);
  }

  int get TraineesNumber {
    return trainee.length;
  }

  void addExercise(Exercises ex) {
    exercise.add(ex);

    notifyListeners();
  }

  void toggleSitups() {
    isSitUps = !isSitUps;
    notifyListeners();
  }

  void toggleSquats() {
    isSquats = !isSquats;
    notifyListeners();
  }

  void togglePushups() {
    isPushUps = !isPushUps;
    notifyListeners();
  }

  List<Trainees> get ListOfTrainees {
    return trainee;
  }

  void remove(Trainees trainees) {
    trainee.remove(trainees);
    notifyListeners();
  }

  void toggleTraineeCheckbox(int index) {
    if (index >= 0 && index < trainee.length) {
      //   isChecked = !isChecked;
      trainee[index].isChecked = !trainee[index].isChecked;
      notifyListeners();
    }
  }

  void toggleTraineePerformance(int index, bool increment) {
    if (index >= 0 && index < trainee.length) {
      if (increment && trainee[index].performance < 10) {
        trainee[index].performance++;
      } else if (!increment && trainee[index].performance > 0) {
        trainee[index].performance--;
      }
      notifyListeners();
    }
  }

  void addATrainee(String name, String belt, String URL) {
    trainee.add(
      Trainees(
        name: name,
        belt: belt,
        URL: URL ?? '',
        isChecked: false,
        performance: 0,
      ),
    );
    notifyListeners();
  }

  void toggleTraineePromotion(int index, bool increment) {
    if (index >= 0 && index < grades.length) {
      if (increment && grades[index].gradeValue < 10) {
        grades[index].gradeValue++;
      } else if (!increment && grades[index].gradeValue > 0) {
        grades[index].gradeValue--;
      }
      notifyListeners();
    }
  }
}
