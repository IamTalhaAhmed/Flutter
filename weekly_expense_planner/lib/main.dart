// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
  bool _switchVal = false;
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

  void _addNewTransaction(String title, double price, DateTime chosenDate) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      time: chosenDate,
      title: title,
      price: price,
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _transaction.removeWhere((tx) => tx.id == id);
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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final dynamic appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Weekly Expense'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: (() => _showTxSheet(context)),
                  child: Icon(CupertinoIcons.add),
                )
              ],
            ),
          )
        : AppBar(
            title: Text('Weekly Expense'),
            // ignore: deprecated_member_use
            actions: [
              IconButton(
                  onPressed: (() => _showTxSheet(context)),
                  icon: Icon(Icons.add))
            ],
          );
    // )) as PreferredSizeWidget;

    final txList = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.75,
        child: TransactionList(_transaction, _removeTransaction));

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //height: (MediaQuery.of(context).size - ) * 0.6,
            if (!isLandscape)
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.25,
                  child: Chart(_recentTx)),
            if (!isLandscape) txList,
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Chart',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Switch.adaptive(
                      activeColor: Theme.of(context).accentColor,
                      value: _switchVal,
                      onChanged: ((value) {
                        setState(() {
                          _switchVal = value;
                        });
                      }))
                ],
              ),
            _switchVal
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.8,
                    child: Chart(_recentTx))
                : txList
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: (() => _showTxSheet(context)),
                    child: Icon(Icons.add),
                  ),
          );
  }
}
