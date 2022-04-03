// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // late String titleInput;
  // late String amountInput;

  NewTransaction(this.newTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <=0 ) {
      return;
    }

    newTx(
      enteredTitle, 
      enteredAmount
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: FlatButton(
                onPressed: () {
                  submitData();
                },
                child: Text(
                  "Add Transaction",
                ),
                textColor: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
