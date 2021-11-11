import 'package:flutter/cupertino.dart';
import 'package:payments_app/models/person.dart';

class Persons with ChangeNotifier {
  final List<Person> _persons = [
    Person(
        id: 'p1',
        name: 'Father',
        phoneNumber: "9000123356",
        imageURL:
            "assets/images/man.png",
        accNum: "1524 5826 7596 3210",
        isFavourite: true),
    Person(
        id: 'p2',
        name: 'Mother',
        phoneNumber: "9815236409",
        imageURL:
            "assets/images/woman.png",
        accNum: "1886 2034 7540 256",
        isFavourite: true),
    Person(
        id: 'p3',
        name: 'Brother',
        phoneNumber: "8745236914",
        imageURL:
            "assets/images/boy.png",
      accNum: "7854 2105 3248 9661",
    ),
    Person(
        id: 'p4',
        name: 'Uncle',
        phoneNumber: "8523641937",
        imageURL:
            "assets/images/man.png",
      accNum: "2517 8520 9641 1028",
    ),
    Person(
        id: 'p5',
        name: 'Wife',
        phoneNumber: "7852693485",
        imageURL:
            "assets/images/woman.png",
        accNum: "5210 2008 5421 9653",
        isFavourite: true),
    Person(
        id: 'p6',
        name: 'Landlord',
        phoneNumber: "9623014895",
        imageURL:
            "assets/images/male.png",
        accNum: "4512 20158 9632 3015",
        isFavourite: true),
    Person(
        id: 'p7',
        name: 'Colleague',
        phoneNumber: "7851023640",
        imageURL:
            "assets/images/boy.png",
      accNum: "14521 75210 9652 4582",
    ),
    Person(
        id: 'p8',
        name: 'Boss',
        phoneNumber: "8541203617",
        imageURL:
            "assets/images/man.png",
      accNum: "5241 6321 0875 1269",
    ),
    Person(
        id: 'p9',
        name: 'Supplier',
        phoneNumber: "756982103",
        imageURL:
            "assets/images/boy.png",
      accNum: "2517 4800 8520 0821",
    ),
    Person(
        id: 'p10',
        name: 'Sister',
        phoneNumber: "8512479023",
        imageURL:
            "assets/images/woman.png",
      accNum: "3651 4152 8600 2570",
    ),
  ];

  List<Person> get persons {
    return [..._persons];
  }

  List<Person> get showFavourites {
    return _persons.where((element) => element.isFavourite).toList();
  }

  Person findById(String id){
    return _persons.firstWhere((element) => element.id==id);
  }



}
