import 'package:flutter/material.dart';
import 'package:mi_card/models/questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  List<Widget> iconsList = [
  ];

  List<Questions> questionList = [
    Questions('You can lead a cow downstairs, but not upstairs.', false),
    Questions('Approximately one quarter of the human bones are in the feet.', true),
    Questions('A slug\'s blood is green', true)
  ];

  // variable to keep track of the question number.
  int questionNumber = 0;

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionList[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(questionList[questionNumber].questionAnswer == true){
                    iconsList.add(
                        const Icon(Icons.check,
                          color: Colors.green,)
                    );
                  }
                  else{
                    iconsList.add(
                        const Icon(Icons.close,
                          color: Colors.red,)
                    );
                  }
                  if(questionNumber == questionList.length-1){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
                      children: [
                        const Text("You finished the quiz."),
                        Row(
                          children: iconsList,
                        )
                      ],
                    )));
                    questionNumber = 0;
                    iconsList.clear();
                  }else{
                    questionNumber++;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(questionList[questionNumber].questionAnswer == false){
                    iconsList.add(
                        const Icon(Icons.check,
                          color: Colors.green,)
                    );
                  }
                  else{
                    iconsList.add(
                        const Icon(Icons.close,
                          color: Colors.red,)
                    );
                  }
                  if(questionNumber == questionList.length-1){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                          children: [
                            const Text("You finished the quiz."),
                            Row(
                              children: iconsList,
                            )
                          ],
                          )
                    ));
                    questionNumber = 0;
                    iconsList.clear();
                  }else{
                    questionNumber++;
                  }
                });              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: iconsList,
          ),
        ),
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
