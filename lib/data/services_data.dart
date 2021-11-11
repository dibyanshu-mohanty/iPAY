import 'package:flutter/material.dart';
import 'package:payments_app/screens/subs_screen/contacts_screen.dart';
import 'package:payments_app/screens/payment_screen/order_pay_screen.dart';

final _services = [
  {
    'name' : 'Send',
    'icon' : const Icon(Icons.send,color: Colors.blue,),
    'color' : Colors.indigoAccent,
    'route' : ContactScreen.routeName,
  },
  {
    'name' : 'Pay',
    'icon' : const Icon(Icons.payments_outlined,color: Colors.pink,),
    'color' : Colors.pinkAccent,
    'route' : PayScreen.routeName,
  },
  {
    'name' : 'Prepaid',
    'icon' : const Icon(Icons.phone_android,color: Colors.green,),
    'color' : Colors.lightGreen,
    'route' : PayScreen.routeName,
  },
  {
    'name' : 'Bill',
    'icon' : const Icon(Icons.payment,color: Colors.purple,),
    'color' : Colors.purpleAccent,
    'route' : PayScreen.routeName,
  },
  {
    'name' : 'Offers',
    'icon' : const Icon(Icons.local_offer,color: Colors.deepOrange,),
    'color' : Colors.deepOrangeAccent,
    'route' : "",
  }
];

 List get services{
  return [..._services];
}