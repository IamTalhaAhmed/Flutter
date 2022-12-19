import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTx;

  TransactionList(this.transactions, this.removeTx);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        // ignore: sort_child_properties_last
        child: (transactions.isEmpty)
            ? Column(
                children: [
                  Text(
                    'No transactions Added yet',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        'assets/image/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 8,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FittedBox(
                              child: Text('RS.${transactions[index].price}')),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].time)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeTx(transactions[index].id),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                  // return Card(
                  //   //color: Colors.green,
                  //   child: Row(children: [
                  //     Container(
                  //       //width: 70,
                  //       margin:
                  //           EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  //       decoration: BoxDecoration(
                  //           //color: Colors.yellow,
                  //           border: Border.all(
                  //         color: Theme.of(context).primaryColor,
                  //         width: 2,
                  //       )),
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         'PKR: ${transactions[index].price.toStringAsFixed(2)}',
                  //         //transaction.price.toString(),
                  //         // ignore: prefer_const_constructors
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 20,
                  //             color: Theme.of(context).primaryColor),
                  //       ),
                  //     ),
                  //     Container(
                  //       margin:
                  //           EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  //       padding: EdgeInsets.all(5),
                  //       child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               transactions[index].title,
                  //               // ignore: prefer_const_constructors
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 20,
                  //                   color: Colors.black),
                  //             ),
                  //             Text(
                  //               DateFormat.yMMMd()
                  //                   .format(transactions[index].time),
                  //               // ignore: prefer_const_constructors
                  //               style: TextStyle(
                  //                 color: Colors.grey,
                  //               ),
                  //             )
                  //           ] //children
                  //           ),
                  //     )
                  //   ] //children
                  //       ),
                  // );
                },
                itemCount: transactions.length,
              ));
  }
}
