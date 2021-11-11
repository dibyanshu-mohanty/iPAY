import 'package:flutter/material.dart';


class CardTitle extends StatelessWidget {
  final String subName;
  final String ansName;
  final Icon iconName;
  CardTitle({required this.subName,required this.ansName,required this.iconName,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(6.0),
      color: Theme.of(context).canvasColor.withOpacity(0.9),
      child: ListTile(
        title: Text(subName),
        subtitle: Text(ansName),
        leading: iconName,
      ),
    );
  }
}
