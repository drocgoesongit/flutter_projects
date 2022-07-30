import 'package:flutter/material.dart';
import 'body_widget.dart';

void main() => runApp(BMIApp());

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1E33),
        appBarTheme: const AppBarTheme(
        color: Color(0xFF1D1E33),
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"
            , style: TextStyle(fontSize: 18.0),),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          automaticallyImplyLeading: true,
        ),

        body: BodyWidget(),
      ),
    );
  }
}

