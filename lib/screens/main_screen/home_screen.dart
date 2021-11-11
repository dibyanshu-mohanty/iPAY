import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/data/services_data.dart';
import 'package:payments_app/providers/purchase_card_provider.dart';
import 'package:payments_app/providers/transaction_provider.dart';
import 'package:payments_app/widgets/money_card.dart';
import 'package:payments_app/widgets/recent_transaction.dart';
import 'package:payments_app/widgets/services_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<PurchaseCards>(context);
    final cards = cardData.cards;
    final transactionData = Provider.of<Transactions>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50.0,
                width: 50.0,
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  "assets/images/user.png",
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined))
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 14.0,top: 10.0),
            child: Text(
              "Your Balance",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.42,
            child: Swiper(
              itemCount: cards.length,
              itemBuilder: (context,index) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Text(
                          "\u{20B9}" + cards[index].balance,
                          style: TextStyle(fontSize: 36.0),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    child:ChangeNotifierProvider.value(
                        value: cards[index], child: MoneyCard()),
                  ),
                ],
              ),
              viewportFraction: 0.95,
              scale: 0.97,
            ),
          ),
          kSizedBox,
          Container(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) => ServiceCard(
                  services[index]['name'],
                  services[index]['icon'],
                  services[index]['color'],
                  services[index]['route']),
              scrollDirection: Axis.horizontal,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Recent Transactions",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: double.infinity,
            height: 120,
            child: transactionData.transactions.isEmpty
            ? Center(child: const Text("No Transactions Found !"))
            : ListView.builder(
              itemCount: transactionData.transactions.length < 2 ? transactionData.transactions.length : 2,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: transactionData.transactions[index],
                  child: TransactionTile(),
              )
            ),
          ),
        ],
      ),
    );
  }
}
