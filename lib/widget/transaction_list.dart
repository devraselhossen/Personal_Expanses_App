// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, deprecated_member_use

import 'package:add_product_demo/widget/transaction_item.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  "No transaction added yet!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                isLandscape
                    ? SizedBox(
                        height: 2,
                      )
                    : SizedBox(
                        height: 20,
                      ),
                Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/iamges/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index], deletetx: deleteTx);
            },
          );
  }
}
