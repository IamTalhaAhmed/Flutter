import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              //color: Colors.green,
              child: Row(children: [
                Container(
                  //width: 70,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      //color: Colors.yellow,
                      border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'PKR: ${transactions[index].price.toStringAsFixed(2)}',
                    //transaction.price.toString(),
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  padding: EdgeInsets.all(5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        Text(
                          DateFormat.yMMMd().format(transactions[index].time),
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
          },
          itemCount: transactions.length,
        ));
  }
}
