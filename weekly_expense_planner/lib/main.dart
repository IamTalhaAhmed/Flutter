// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import './widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _showTxSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransactions(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              onPressed: (() => _showTxSheet(context)), icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                color: Theme.of(context).primaryColorLight,
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
            TransactionList(_transaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (() => _showTxSheet(context)),
        child: Icon(Icons.add),
      ),
    );
  }
}
