import 'package:flutter/cupertino.dart';

class Person with ChangeNotifier{
  final String id;
  final String name;
  final String phoneNumber;
  final String imageURL;
  final String accNum;
  bool isFavourite;

  Person({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.imageURL = "assets/images/placeholder.png",
    required this.accNum,
    this.isFavourite = false,
  });

  void toggleFavourites() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
