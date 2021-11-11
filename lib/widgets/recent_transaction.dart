import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payments_app/models/transaction.dart';
import 'package:provider/provider.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transaction = Provider.of<Transaction>(context);
    return Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white38.withOpacity(0.5),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 20.0,
            child: Icon(Icons.money),
          ),
          title: Text(transaction.title),
          subtitle: Row(
            children: [
              Text((DateFormat('dd-MM-yyyy           hh:mm').format(transaction.dateTime)).toString()),
            ],
          ),
          trailing: Text("-\u{20B9} ${transaction.amount}"),
        ),
    );
  }
}
