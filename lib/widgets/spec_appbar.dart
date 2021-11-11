import 'package:flutter/material.dart';


class SpecAppBar extends StatelessWidget {
  final String title;
  final bool isMainScreen;
  const SpecAppBar(this.title,this.isMainScreen,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isMainScreen
            ? Container()
        : IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
