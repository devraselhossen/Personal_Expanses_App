// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:add_product_demo/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Bat", amount: 780.50, date: DateTime.now()),
    Transaction(
        id: "t2", title: "New Ball", amount: 120.50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Add Transaction",
                      ),
                      textColor: Colors.purple,
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
            return Card(
              elevation: 1,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.purple)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
