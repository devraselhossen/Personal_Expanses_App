// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

import 'model/transaction.dart';
import 'widget/chart.dart';
import 'widget/new_transaction.dart';
import 'widget/transaction_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showChart = false;
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: "t1",
    //     title: "New Bat",
    //     amount: 780.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t2",
    //     title: "New Ball",
    //     amount: 120.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t1",
    //     title: "New Bat",
    //     amount: 780.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t2",
    //     title: "New Ball",
    //     amount: 120.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t1",
    //     title: "New Bat",
    //     amount: 780.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t2",
    //     title: "New Ball",
    //     amount: 120.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t1",
    //     title: "New Bat",
    //     amount: 780.50,
    //     date: DateTime.now(),
    //     time: ''),
    // Transaction(
    //     id: "t2",
    //     title: "New Ball",
    //     amount: 120.50,
    //     date: DateTime.now(),
    //     time: ''),
  ];

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate, String choseTime) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate,
        time: choseTime);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text("Personal Expanses"),
      actions: [
        IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: _appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Show Chart"),
                Switch(value: _showChart, onChanged: (value) {
                  setState(() {
                    _showChart = value;
                  });
                })
              ],
            ),
            _showChart ? Container(
                height: (MediaQuery.of(context).size.height -
                        _appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.35,
                child: Chart(_recentTransactions))
           : Container(
                height: (MediaQuery.of(context).size.height -
                        _appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.65,
                child: TransactionList(_userTransactions, _deleteTransaction))
          ],
        ),
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
