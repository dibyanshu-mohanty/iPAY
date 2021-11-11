import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/providers/purchase_card_provider.dart';
import 'package:payments_app/widgets/card_detail.dart';
import 'package:payments_app/widgets/spec_appbar.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  static const routeName = "/CardScreen";
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final card = Provider.of<PurchaseCards>(context).findById(id.toString());
    return Scaffold(
      body: SafeArea(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              kSizedBox,
              SpecAppBar(card.cardNumber,false),
              kSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Card Details",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w700)),
                  SizedBox(width: 5.0,),
                  Icon(Icons.verified,color: Colors.green,),
                ],
              ),
              CardTitle(
                  subName: "Holder Name",
                  ansName: card.holderName,
                  iconName: Icon(Icons.account_circle_outlined),
              ),
              CardTitle(
                subName: "Account Number",
                ansName: card.cardNumber,
                iconName: Icon(Icons.credit_card_rounded),
              ),
              CardTitle(
                subName: "Balance",
                ansName: "\u{20B9} " + card.balance,
                iconName: Icon(Icons.attach_money_sharp),
              ),
              CardTitle(
                subName: "Expiry Date",
                ansName: card.expiryDate,
                iconName: Icon(Icons.calendar_today),
              ),
              CardTitle(
                subName: "CVV",
                ansName: card.cvv,
                iconName: Icon(Icons.lock_outline_rounded),
              ),
            ],
          ),
        ),
      );
  }
}
