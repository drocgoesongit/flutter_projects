import 'package:flutter/material.dart';
import '../const/const.dart';
import 'reusable_widget.dart';

class BMIResults extends StatelessWidget {
  BMIResults({required this.bmi1, required this.resultOutcome, required this.interpretation});

  final String bmi1;
  final String resultOutcome;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text("Results"),
        ),
      body: BMIResultBody(bmi: bmi1, resultOutcome: resultOutcome, interpretation: interpretation,),
      );
  }
}

class BMIResultBody extends StatelessWidget {
  BMIResultBody({required this.bmi, required this.resultOutcome, required this.interpretation});

  final String bmi;
  final String resultOutcome;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ReusableWidget(
            colour: kActiveColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultOutcome,
                style: kResultMainText),
                Text(bmi.toString(),
                style: kNumberBmi,),
                Text(interpretation,
                style: kNoteStyle,
                textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 15.0),
            height: kBottomContainerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: kBottomContainerColor,
            ),
            child: const Center(
              child: Text(
                "Thanks"
                    "",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

