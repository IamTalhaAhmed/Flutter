import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transaction = [
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
  void _addNewTransaction(String title, double price) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      time: DateTime.now(),
      title: title,
      price: price,
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(_addNewTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
