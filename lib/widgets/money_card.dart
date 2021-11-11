import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/models/purchase_card.dart';
import 'package:payments_app/screens/subs_screen/card_screen.dart';
import 'package:provider/provider.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<PurchaseCard>(context);
    return InkWell(
      onDoubleTap: () {
        Navigator.pushNamed(context, CardScreen.routeName, arguments: card.id);
      },
      child: FlipCard(
        fill: Fill.fillBack,
        front: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.white, Colors.black38]),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          margin: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 60,
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/images/Visa.png",
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    child: Image.asset("assets/images/mastercard.png"),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              Text(
                card.cardNumber,
                style: kPurchaseCardTextStyle,
                textAlign: TextAlign.center,
              ),
              Text(
                card.expiryDate,
                style: kPurchaseCardTextStyle.copyWith(fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
              Text(
                card.holderName,
                style: kPurchaseCardTextStyle.copyWith(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                width: double.infinity,
                child: const Text(
                  "iPAY",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        back: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black38, Colors.white]),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text("www.iPay.in"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text("991752FB"),
                )
              ],
            ),
            kSizedBox,
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white30,
              ),
            ),
            kSizedBox,
              Container(
                width: 50,
                height: 20,
                alignment: Alignment.center,
                child: Center(
                  child: Text('${card.cvv.replaceAll(RegExp(r"."), "*")}')
                ),
              ),
            SizedBox(height: 20.0,),
            const Text(
              "iPAY",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            )
            // Container(
            //     width: double.infinity,
            //     height: 60,
            //     child: Image.asset(
            //       "assets/images/iPAY.png",
            //       fit: BoxFit.cover,
            //     ))
          ]),
        ),
      ),
    );
  }
}
