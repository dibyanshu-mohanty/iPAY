import 'package:flutter/cupertino.dart';
import 'package:payments_app/models/purchase_card.dart';

class PurchaseCards with ChangeNotifier {
  final List<PurchaseCard> _cards = [
    PurchaseCard(
        id: 'c1',
        cardNumber: "1524 2568 7890 6320",
        cvv: "123",
        expiryDate: "04/29",
        holderName: "AKHANDANAND TRIPATHI",
        balance: "52520"
    ),
    PurchaseCard(
        id: 'c2',
        cardNumber: "9852 0450 7813 2550",
        cvv: "456",
        expiryDate: "12/26",
        holderName: "GUDDU PANDIT",
        balance: "84519"),
  ];

  List<PurchaseCard> get cards{
    return [..._cards];
  }

  // String showBalance(String id){
  //   return _cards.firstWhere((element) => element.id==id).balance;
  // }
  void updateBalance(String id,int amount){
    _cards.firstWhere((element) => element.id==id).balance = (int.parse(_cards.firstWhere((element) => element.id==id).balance) - amount).toString();
    notifyListeners();
  }

  PurchaseCard findById(String id){
    return _cards.firstWhere((element) => element.id == id);
  }

  PurchaseCard initialCard(){
    return _cards[0];
  }

}
