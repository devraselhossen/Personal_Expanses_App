// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedTime;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null || _selectedTime == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate, _selectedTime);
    Navigator.of(context).pop();
  }

  void _presentdatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
    ).then((pickedTime) {
      if (pickedTime == null) {
        return;
      }else {
        setState(() {
          _selectedTime = pickedTime.format(context).toString();
        });
      }
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              keyboardType: TextInputType.text,
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    _selectedDate == null
                        ? "No Date Chosen!"
                        : "Picked Date : ${DateFormat.yMMMd().format(_selectedDate!)}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                FlatButton(
                  onPressed: _presentdatePicker,
                  child: Text(
                    "Chose Date",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    _selectedTime == null
                        ? "No Time Chosen!"
                        : "Picked Time : ${_selectedTime}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                FlatButton(
                  onPressed: _presentTimePicker,
                  child: Text(
                    "Chose Time",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  _submitData();
                },
                child: Text(
                  "Add Transaction",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
