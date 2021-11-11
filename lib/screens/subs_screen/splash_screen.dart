import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/screens/main_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
            () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset("assets/images/splash.png",fit: BoxFit.cover,),
              ),
              Column(
                children: [
                  Text("iPAY",style: TextStyle(fontSize: 48.0,),),
                  kSizedBox,
                  Text("Payments made simple !",style: TextStyle(fontSize: 20.0),),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.45,child: LinearProgressIndicator(backgroundColor: Theme.of(context).scaffoldBackgroundColor,color: Theme.of(context).primaryColorDark,)),
            ],
          ),
        )
    );
  }
}
