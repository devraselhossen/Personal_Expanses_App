// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:add_product_demo/widget/new_transaction.dart';
import 'package:add_product_demo/widget/transaction_list.dart';
import 'package:flutter/material.dart';

import 'model/transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1", title: "New Bat", amount: 780.50, date: DateTime.now()),
    // Transaction(
    //     id: "t2", title: "New Ball", amount: 120.50, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expanses"),
        actions: [
          IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Card(
                    elevation: 5,
                    child: Center(
                        child: Text(
                      "Chart!",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                  ),
                ),
                TransactionList(_userTransactions)
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: () {
          startAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
