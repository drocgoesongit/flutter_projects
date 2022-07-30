import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: MyApp(),
        appBar: AppBar(
          titleTextStyle: const TextStyle(fontFamily: 'SourceSansPro', color: Colors.white),
          title: const Text("Magic 8Ball"),
          centerTitle: true,
          backgroundColor: Colors.black45,
        ),
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 1;
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Expanded(
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            padding: const EdgeInsets.all(14.0),
            elevation: 10.0,
            color: null,
            onPressed: () {
              setState(() {
                number = Random().nextInt(5) + 1;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Magic Ball pressed."),
                  duration: Duration(milliseconds: 500),
                )
              );
            },
              child: Image.asset('assets/images/ball$number.png')),
        ),
      ),
    );
  }
}
