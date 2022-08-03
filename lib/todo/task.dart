import 'package:flutter/material.dart';

class Task {
  final String task;
  bool isDone;

  Task({required this.task, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

}
