import 'package:flutter/material.dart';

class Transaction {
  late final String id;
  final String title;
  final double amount;
  final DateTime date;
  final String time;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.time
  });
}
