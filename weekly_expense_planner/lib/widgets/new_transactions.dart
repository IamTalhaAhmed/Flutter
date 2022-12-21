// ignore_for_file: prefer_const_constructors
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTx;
  //final Function

  NewTransactions(this.addNewTx);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _titlecontroller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final _enteredTitle = _titlecontroller.text;
    final _enteredAmount = double.parse(_amountController.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // ignore: curly_braces_in_flow_control_structures
    widget.addNewTx(_enteredTitle, _enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titlecontroller,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: _amountController,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date Choosen'
                          : 'Picked Date: ${DateFormat.yMEd().format(_selectedDate!)}'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: _presentDate,
                      // ignore: sort_child_properties_last
                      child: Text('Choose date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  print(_titlecontroller.text);
                  print(_amountController.text);
                  _submitData();
                },
                // ignore: sort_child_properties_last
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 18),
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
