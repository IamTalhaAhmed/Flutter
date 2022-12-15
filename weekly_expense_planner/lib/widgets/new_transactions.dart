// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './user_transactions.dart';

class NewTransactions extends StatelessWidget {
  final Function addNewTx;
  final titlecontroller = TextEditingController();
  final amountController = TextEditingController();

  NewTransactions(this.addNewTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                print(titlecontroller.text);
                print(amountController.text);
                addNewTx(
                    titlecontroller.text, double.parse(amountController.text));
              },
              // ignore: sort_child_properties_last
              child: Text(
                'Add Transaction',
                style: TextStyle(fontSize: 18),
              ),
              style: TextButton.styleFrom(foregroundColor: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}
