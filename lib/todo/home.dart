import 'package:flutter/material.dart';
import 'package:mi_card/todo/task_screen.dart';

void main() => runApp(const TaskApp());

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlueAccent,
      home: SafeArea(child: TaskScreen()),
    );
  }
}

