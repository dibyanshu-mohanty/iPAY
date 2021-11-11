import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/models/purchase_card.dart';
import 'package:payments_app/providers/purchase_card_provider.dart';
import 'package:payments_app/providers/transaction_provider.dart';
import 'package:payments_app/widgets/spec_appbar.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class PayScreen extends StatefulWidget {
  static const routeName = "/PayScreen";

  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  final _payController = TextEditingController();
  final _paidController = TextEditingController();
  final _accController = TextEditingController();
  final _cvvController = TextEditingController();
  var selectedCard = PurchaseCards().initialCard();

  String cvv ="";
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _payController.dispose();
    _paidController.dispose();
    _accController.dispose();
    _cvvController.dispose();
  }

  void resetAll(){
    _payController.clear();
    _paidController.clear();
    _accController.clear();
    _cvvController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<PurchaseCards>(context, listen: false);
    final cards = cardData.cards;
    final transactionData = Provider.of<Transactions>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            kSizedBox,
            const SpecAppBar("Make Payment", false),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
              child: TextField(
                controller: _payController,
                decoration: const InputDecoration(
                    labelText: "\u{20B9} Enter Amount",
                    border: UnderlineInputBorder()),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
              child: TextField(
                controller: _accController,
                decoration: const InputDecoration(
                    labelText: "Acc. No. of Receiver", border: UnderlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
            ),
            TextField(
              style: const TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Paid to",
                hintStyle: const TextStyle(fontSize: 16.0),
                focusColor: Theme.of(context).primaryColorDark,
                border: InputBorder.none,
              ),
              controller: _paidController,
              onChanged: (_) {},
              keyboardType: TextInputType.name,
            ),
            kSizedBox,
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              margin: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const Text("Select Card"),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: ListView.builder(
                      itemCount: cards.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: const Icon(Icons.credit_card_rounded),
                        title: Text(cards[index].cardNumber),
                        trailing: Radio<PurchaseCard>(
                            value: cards[index],
                            groupValue: selectedCard,
                            onChanged: (value) {
                              setState(() {
                                selectedCard = value!;
                              });
                            }
                         ),
                      ),
                    ),
                  ),
                  TextField(
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Enter CVV",
                      hintStyle: const TextStyle(fontSize: 12.0),
                      focusColor: Theme.of(context).primaryColorDark,
                      border: InputBorder.none,
                    ),
                    controller: _cvvController,
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            kSizedBox,
            ConfirmationSlider(
              onConfirmation: () {
                if (cvv != selectedCard.cvv) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Incorrect CVV",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                if (_payController.text.isEmpty || _paidController.text.isEmpty || _accController.text.length != 19 ||
                    double.parse(_payController.text) < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Please Fill out all fields",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red,
                  ));
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        margin: const EdgeInsets.all(10.0),
                        child: ListView(
                          children: [
                            ListTile(
                              leading: const Text("Sending to"),
                              trailing: Text(_paidController.text),
                            ),
                            const Divider(
                              thickness: 5.0,
                            ),
                            ListTile(
                              leading: const Text("Paid to"),
                              trailing: Text(_accController.text),
                            ),
                            const Divider(
                              thickness: 5.0,
                            ),
                            ListTile(
                              leading: const Text("Amount"),
                              trailing:
                              Text("\u{20B9}" + _payController.text),
                            ),
                            const Divider(
                              thickness: 5.0,
                            ),
                            ListTile(
                              leading: const Text("Paid Via"),
                              trailing: Text(selectedCard.cardNumber),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                transactionData.addTransaction(_paidController.text, double.parse(_payController.text));
                                cardData.updateBalance(selectedCard.id, int.parse(_payController.text));
                                resetAll();
                                CoolAlert.show(
                                  context: context,
                                  type: CoolAlertType.success,
                                  text: "Your transaction was successful!",
                                  onConfirmBtnTap: () => Navigator.popUntil(context, ModalRoute.withName(PayScreen.routeName)),
                                  // onCancelBtnTap: (){
                                  //   Navigator.pop(context);
                                  // },
                                  confirmBtnColor: Theme.of(context).primaryColorDark,
                                );
                              },
                              child: const Text("Confirm Payment"),
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    Theme.of(context)
                                        .primaryColorDark),
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              },
              text: "Swipe to Pay",
              width: MediaQuery.of(context).size.width * 0.9,
              textStyle: const TextStyle(color: Colors.white, fontSize: 16.0),
              backgroundColor: const Color(0xFFF8F5F1).withOpacity(0.4),
              foregroundColor: Theme.of(context).primaryColorDark,
              backgroundShape: BorderRadius.circular(12.0),
              foregroundShape: BorderRadius.circular(10.0),
            ),
          ]),
        ),
      ),
    );
  }
}
