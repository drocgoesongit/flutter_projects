import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Dicee"),
        centerTitle: true,
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int rightDiceIndex = 1;
  int leftDiceIndex = 1;
  void changeNumber() {
    setState(() {
      rightDiceIndex = Random().nextInt(6) + 1;
      leftDiceIndex = Random().nextInt(6) + 1;
    });
  }
    Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: double.infinity,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              onPressed: () {
                changeNumber();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("left dice clicked. $leftDiceIndex + $rightDiceIndex"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      duration: const Duration(milliseconds: 500),
                    )
                );
              },
              color: null,
              padding: const EdgeInsets.all(0.0),
              child: Image.asset('assets/images/dice$leftDiceIndex.png'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
                color: null,
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  setState((){
                    changeNumber();
                    // rightDiceIndex = Random().nextInt(6) + 1;
                    // leftDiceIndex = Random().nextInt(6) + 1;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Right dice clicked. $rightDiceIndex + $leftDiceIndex"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        duration: const Duration(milliseconds: 500),
                      )
                  );
                },
                child: Image.asset('assets/images/dice$rightDiceIndex.png')),
          ),
        ),
      ],
    );
  }
}



