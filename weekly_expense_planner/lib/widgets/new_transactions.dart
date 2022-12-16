// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTx;

  NewTransactions(this.addNewTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final titlecontroller = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // ignore: curly_braces_in_flow_control_structures
    widget.addNewTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: () {
                print(titlecontroller.text);
                print(amountController.text);
                submitData();
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
