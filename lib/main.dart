import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payments_app/models/purchase_card.dart';
import 'package:payments_app/providers/person_provider.dart';
import 'package:payments_app/providers/purchase_card_provider.dart';
import 'package:payments_app/providers/transaction_provider.dart';
import 'package:payments_app/screens/payment_screen/contact_payment_screen.dart';
import 'package:payments_app/screens/subs_screen/card_screen.dart';
import 'package:payments_app/screens/subs_screen/contacts_screen.dart';
import 'package:payments_app/screens/main_screen/home_screen.dart';
import 'package:payments_app/screens/main_screen/login_screen.dart';
import 'package:payments_app/screens/mainframe.dart';
import 'package:payments_app/screens/payment_screen/order_pay_screen.dart';
import 'package:payments_app/screens/subs_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Persons()),
        ChangeNotifierProvider(create: (context) => PurchaseCards()),
        ChangeNotifierProvider(create: (context) => Transactions()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF272A3F),
          primaryColorDark: const Color(0xFFF35383),
          cardColor: const Color(0xFF333438),
          primaryColor: const Color(0xFF534293),
          canvasColor: const Color(0xFF272A3F),
          textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Circular Std',
          ),
        ),
        home: SplashScreen(),
        routes: {
          LoginScreen.routeName : (context) => LoginScreen(),
          HomeScreen.routeName : (context) => const HomeScreen(),
          ContactScreen.routeName : (context) => const ContactScreen(),
          CardScreen.routeName : (context) => const CardScreen(),
          PayScreen.routeName : (context) => PayScreen(),
          ContactPaymentScreen.routeName : (context) => ContactPaymentScreen(),
        },
      ),
    );
  }
}

