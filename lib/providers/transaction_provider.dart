import 'package:flutter/cupertino.dart';
import 'package:payments_app/models/transaction.dart';

class Transactions with ChangeNotifier{

  List<Transaction> _transactions =[];

  List<Transaction> get transactions{
    return[..._transactions];
  }

  void addTransaction(String title, double price){
    _transactions.insert(0, Transaction(id: DateTime.now().toString(), title: title, dateTime: DateTime.now(), amount: price));
    notifyListeners();
  }
}