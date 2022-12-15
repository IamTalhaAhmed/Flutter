// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      price: 6500,
      time: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Jacket',
      price: 8500,
      time: DateTime.now(),
    ),
  ];
  final titlecontroller = TextEditingController();
  final amountController = TextEditingController();
  // String titleInput = '';
  // String amountInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Card(
                color: Colors.blue,
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      'Chart',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
            Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titlecontroller,
                      //onChanged: (val) => titleInput = val,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                      //onChanged: (val) => amountInput = val,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titlecontroller.text);
                        print(amountController.text);
                      },
                      // ignore: sort_child_properties_last
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(fontSize: 18),
                      ),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.purple),
                    ),
                  ],
                ),
              ),
            ),
            Column(
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    padding: EdgeInsets.all(5),
                    // decoration: BoxDecoration(
                    //    border: Border.all(
                    //   color: Colors.purple,
                    //   width: 3,
                    // )
                    //),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction.time),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ]),
                  )
                ]),
              );
            }).toList())
          ],
        ));
  }
}
