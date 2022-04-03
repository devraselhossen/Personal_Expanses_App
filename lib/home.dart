// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:add_product_demo/transaction.dart';
import 'package:flutter/material.dart';

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
        id: "t2", title: "New Ball", amount: 70.50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Text("Chart!"),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Text(tx.title),
              );
            }).toList()
          )
        ],
      ),
    );
  }
}
