import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function nextQuestion;
  final String answer;
  Answers(this.nextQuestion, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
        child: Text(answer),
        onPressed: nextQuestion,
      ),
    );
  }
}
