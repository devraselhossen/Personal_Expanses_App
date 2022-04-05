import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
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
        return {"day": DateFormat.E().format(weakDay).substring(0, 1), "amount": totalSum};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((value) {
          return Text('${value['day']}:${value['amount']}'+"  ");
        }).toList(),
      ),
    );
  }
}
