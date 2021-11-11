import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/models/purchase_card.dart';
import 'package:payments_app/providers/person_provider.dart';
import 'package:payments_app/providers/purchase_card_provider.dart';
import 'package:payments_app/providers/transaction_provider.dart';
import 'package:payments_app/screens/subs_screen/contacts_screen.dart';
import 'package:payments_app/widgets/spec_appbar.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ContactPaymentScreen extends StatefulWidget {
  static const routeName = "/ContactPaymentScreen";
  const ContactPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ContactPaymentScreen> createState() => _ContactPaymentScreenState();
}

class _ContactPaymentScreenState extends State<ContactPaymentScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  var selectedCard = PurchaseCards().initialCard();

  String cvv ="";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final personData =
        Provider.of<Persons>(context, listen: false).findById(id.toString());
    final cardData = Provider.of<PurchaseCards>(context,listen: false);
    final cards = cardData.cards;
    final transactionData = Provider.of<Transactions>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kSizedBox,
              SpecAppBar("Paying to " + personData.name, false),
              kSizedBox,
              CircleAvatar(
                radius: 30.0,
                child: Image.asset(
                  personData.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
              kSizedBox,
              Container(
                width: 120.0,
                height: 50.0,
                alignment: Alignment.center,
                child: TextField(
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter Amount",
                    hintStyle: const TextStyle(fontSize: 16.0),
                    focusColor: Theme.of(context).primaryColorDark,
                    border: InputBorder.none,
                  ),
                  controller: _controller,
                  onChanged: (value) {},
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  margin: const EdgeInsets.all(10.0),
                  child: ListView(children: [
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
                              }),
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
                    )
                  ])),
              const SizedBox(
                height: 20.0,
              ),
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
                  if (_controller.text.isEmpty ||
                      double.parse(_controller.text) < 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Invalid Amount",
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
                                    trailing: Text(personData.name),
                                  ),
                                  const Divider(
                                    thickness: 5.0,
                                  ),
                                  ListTile(
                                    leading: const Text("Paid to"),
                                    trailing: Text(personData.accNum),
                                  ),
                                  const Divider(
                                    thickness: 5.0,
                                  ),
                                  ListTile(
                                    leading: const Text("Amount"),
                                    trailing:
                                        Text("\u{20B9}" + _controller.text),
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
                                      transactionData.addTransaction(personData.name, double.parse(_controller.text));
                                      cardData.updateBalance(selectedCard.id, int.parse(_controller.text));
                                      _controller.clear();
                                      _cvvController.clear();
                                      CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.success,
                                        text: "Your transaction was successful!",
                                        onConfirmBtnTap: () => Navigator.popUntil(context, ModalRoute.withName(ContactScreen.routeName)),
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
            ],
          ),
        ),
      ),
    );
  }
}
