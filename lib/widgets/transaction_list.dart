import 'package:flutter/material.dart';
import 'package:personal_expense_tracker/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(children: <Widget>[
              Text(
                'No Transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}')),
                        )),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.bodyText1),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing:
                        IconButton(icon: Icon(Icons.star), onPressed: null),
                  ),
                );
                // return Card(
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.symmetric(
                //         vertical: 30,
                //         horizontal: 15,
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Theme.of(context).primaryColorDark,
                //             width: 2),
                //       ),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Theme.of(context).primaryColor,
                //           )),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(transactions[index].title,
                //             style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 16,
                //             )),
                //         Text(
                //           DateFormat.yMMMd().format(transactions[index].date),
                //           style: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     )
                //   ]),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
