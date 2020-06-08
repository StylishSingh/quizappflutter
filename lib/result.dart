import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;

    if (resultScore <= 12) {
      resultText = 'You\'re Beginner';
    } else if (resultScore <= 18) {
      resultText = 'You\'re Intermediate';
    } else if (resultScore >= 25) {
      resultText = 'You\'re Advanced';
    } else {
      resultText = 'You\'re so bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(onPressed: resetHandler, child: Text('Restart Quiz!'),textColor: Colors.blue,)
      ]),
    );
  }
}
