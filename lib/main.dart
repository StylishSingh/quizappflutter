import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(PractiseApp());
// }

void main() => runApp(PractiseApp());

class PractiseApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PractiseAppState();
  }
}

class _PractiseAppState extends State<PractiseApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 30},
        {'text': 'White', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Dog', 'score': 4},
        {'text': 'Lion', 'score': 3},
        {'text': 'Elephant', 'score': 2}
      ]
    },
    {
      'questionText': 'Who\'s your favorite Instructor',
      'answers': [
        {'text': 'Aman', 'score': 1},
        {'text': 'Aman', 'score': 1},
        {'text': 'Aman', 'score': 1},
        {'text': 'Aman', 'score': 1}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore=0;

  void _answerQuestion(int score) {
    
    _totalScore+=score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Total Score: $_totalScore');
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
