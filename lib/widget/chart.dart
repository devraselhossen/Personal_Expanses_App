import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weakDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weakDay.day &&
              recentTransaction[i].date.month == weakDay.month &&
              recentTransaction[i].date.year == weakDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {
          "day": DateFormat.E().format(weakDay).substring(0, 1),
          "amount": totalSum
        };
      },
    );
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((value) {
          return ChartBar(
              value["day"],
              value["amount"],
              totalSpending == 0.0
                  ? 0.0
                  : (value["amount"] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
