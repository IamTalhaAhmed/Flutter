import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //const Result({Key key}) : super(key: key);
  final int totalScore;
  final Function reset;
  Result(this.totalScore,this.reset);

  String get resultPhrase{
   String resultPhrase;
    if (totalScore < 12){
      resultPhrase = 'Good Work done Israr';
    } else if(totalScore < 14) {
      resultPhrase = 'Good Work done Talha';
    } else {
      resultPhrase = 'Good Work done Faizan';
    }
    return resultPhrase;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:Center(
        child : Column( 
          children: [ Text(resultPhrase,
          style: TextStyle(fontSize: 34,color: Colors.black45),
          textAlign: TextAlign.center,),
          ElevatedButton(onPressed: reset, child: Text('reset'))]
        )  
      ),
    );
  }
}