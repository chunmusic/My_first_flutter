import 'package:flutter/material.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _answerText = "";
  var _isCorrect = false;

  void onPressTomHank() {
    print('This is Hulk.');

    setState(() {
      _questionIndex += 1;
      _answerText = "true";
      _isCorrect = true;
    });
    print('Index = $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'Who is your daddy?',
      'Who is your mom?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  child: Text("Tony Stark"),
                  onPressed: () {
                    print('I am Tony Stark.');
                    setState(() {
                      _answerText = "false";
                      _isCorrect = false;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  child: Text("Thor"),
                  onPressed: () {
                    print('Thor is my Daddy');
                    setState(() {
                      _answerText = "false";
                      _isCorrect = false;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                child: Text("Hulk"),
                onPressed: onPressTomHank,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                child: Text("Captain Ameraica"),
                onPressed: () {
                  print("Click Captain America");
                  setState(() {
                    _answerText = "false";
                    _isCorrect = false;
                  });
                },
              ),
            ),
            _isCorrect ? Question("True") : Text("False")
          ],
        ),
      ),
    );
  }
}
