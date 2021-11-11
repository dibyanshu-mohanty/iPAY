import 'package:flutter/cupertino.dart';

class Transaction with ChangeNotifier{
  final String id;
  final String title;
  final DateTime dateTime;
  final double amount;

  Transaction(
      {required this.id,
      required this.title,
      required this.dateTime,
      required this.amount});
}
