// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import './widgets/chart.dart';
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
      title: 'Weekly Expense',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'OpenSans'),
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
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   price: 6500,
    //   time: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Jacket',
    //   price: 8500,
    //   time: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTx {
    return _transaction.where((tx) {
      return tx.time.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
        title: Text('Weekly Expense'),
        // ignore: deprecated_member_use
        actions: [
          IconButton(
              onPressed: (() => _showTxSheet(context)), icon: Icon(Icons.add))
        ],
        // titleTextStyle: Theme.of(context).textTheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTx),
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
