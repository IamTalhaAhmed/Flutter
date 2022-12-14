import 'package:flutter/material.dart';
import './Quiz.dart';
import './result.dart';

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
  var _questions = [
    {
      'question': " What's your name? ",
      'answer': [
        {'text': 'Talha', 'score': 5},
        {'text': 'Faizan', 'score': 8},
        {'text': 'Israr', 'score': 3}
      ]
    },
    {
      'question': "What's your age?",
      'answer': [
        {'text': '23', 'score': 1},
        {'text': '24', 'score': 1},
        {'text': '25', 'score': 1}
      ]
    },
    {
      'question': "What's your job",
      'answer': [
        {'text': 'back-end developer', 'score': 7},
        {'text': 'back-end manager', 'score': 9},
        {'text': 'python developer', 'score': 7}
      ]
    }
  ];
  var _index = 0;
  var _totalScore = 0;
  void _reset() {
    setState(() {
      _index = 0;
    _totalScore = 0;
    });
    
  }

  @override
  void _nextQuestion(int score) {
    _totalScore += score;
    setState(() {
      _index = _index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Quiz App'),
            ),
            body: _index < _questions.length
                ? Quiz(
                    nextQuestion: _nextQuestion,
                    question: _questions,
                    index: _index)
                //Quiz(_nextQuestion,_questions[_index]['question'],_index)
                : Result(_totalScore, _reset)));
  }
}
