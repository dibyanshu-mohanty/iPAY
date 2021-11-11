import 'package:flutter/cupertino.dart';

class PurchaseCard with ChangeNotifier{
  final String id;
  final String cardNumber;
  final String cvv;
  final String holderName;
  final String expiryDate;
  String balance;

  PurchaseCard(
      {required this.id,
      required this.cardNumber,
      required this.cvv,
      required this.expiryDate,
      required this.holderName,
      required this.balance});
}
