// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deletetx;

  TransactionItem({required this.transaction, required this.deletetx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: EdgeInsets.all(7.0),
              child: FittedBox(
                child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text(DateFormat.yMMMMd().format(transaction.date),
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Text(transaction.time.toString(),
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ],
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  textColor: Theme.of(context).errorColor,
                  onPressed: () {
                    deletetx(transaction.id);
                  },
                  label: Text("Delete"),
                  icon: Icon(Icons.delete),
                )
              : IconButton(
                  onPressed: () {
                    deletetx(transaction.id);
                  },
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                ),
        ),
      ),
    );
  }
}
