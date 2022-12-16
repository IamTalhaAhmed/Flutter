// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weekly_expense_planner/models/transaction.dart';
import 'package:weekly_expense_planner/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTx;
  Chart(this.recentTx);

  List<Map<String, Object>> get groupedTxValues {
    // print(recentTx.length);
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTx.length; i++) {
        if (recentTx[i].time.day == weekDay.day &&
            recentTx[i].time.month == weekDay.month &&
            recentTx[i].time.year == weekDay.year) {
          totalSum += recentTx[i].price;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalamount {
    return groupedTxValues.fold(0.0, (sum, element) {
      return sum + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTxValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTxValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  (data['day'] as String),
                  (data['amount'] as double),
                  (totalamount == 0.0)
                      ? 0.0
                      : (data['amount'] as double) / totalamount),
            );
          }).toList(),
        ),
      ),
    );
  }
}
