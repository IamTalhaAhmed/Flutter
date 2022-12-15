import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: transactions.map((transaction) {
      return Card(
        //color: Colors.green,
        child: Row(children: [
          Container(
            //width: 70,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
                //color: Colors.yellow,
                border: Border.all(
              color: Colors.purple,
              width: 2,
            )),
            padding: EdgeInsets.all(10),
            child: Text(
              'PKR: ${transaction.price}',
              //transaction.price.toString(),
              // ignore: prefer_const_constructors
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            padding: EdgeInsets.all(5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                transaction.title,
                // ignore: prefer_const_constructors
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.time),
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ] //children
                    ),
          )
        ] //children
            ),
      );
    }).toList());
  }
}
