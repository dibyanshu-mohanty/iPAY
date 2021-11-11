import 'package:flutter/material.dart';
import 'package:payments_app/providers/transaction_provider.dart';
import 'package:payments_app/widgets/recent_transaction.dart';
import 'package:payments_app/widgets/spec_appbar.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<Transactions>(context).transactions;
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SpecAppBar("My Transactions", true),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: transactions.isEmpty
                  ? const Center(child: Text("No Transactions Done ! Pay your Bills Now !!"))
                  : ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                            value: transactions[index],
                            child: TransactionTile(),
                      ),
                    ),
            )
          ],
    );
  }
}
