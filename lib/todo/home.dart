import 'package:flutter/material.dart';
import 'package:mi_card/todo/task_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.lightBlueAccent,
      home: SafeArea(child: TaskScreen()),
    );
  }
}

