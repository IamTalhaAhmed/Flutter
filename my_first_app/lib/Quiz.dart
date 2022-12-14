import 'package:flutter/material.dart';
import 'questions.dart';
import 'answers.dart';

class Quiz extends StatelessWidget {
  final Function nextQuestion;
  final List<Map<String, Object>> question;
  final int index;
  Quiz(
      {@required this.nextQuestion,
      @required this.question,
      @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question(question[index]['question']),
      ...(question[index]['answer'] as List<Map<String, Object>>).map((answer) {
        return Answers(() => nextQuestion(answer['score']), answer['text']);
      }).toList()
    ]);
  }
}
