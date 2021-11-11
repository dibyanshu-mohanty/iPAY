import 'package:flutter/material.dart';
import 'package:payments_app/screens/subs_screen/contacts_screen.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final Icon serviceIcon;
  final Color bgColor;
  final String route;
  const ServiceCard(this.title, this.serviceIcon, this.bgColor, this.route, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(children: [
          CircleAvatar(
            child: serviceIcon,
            backgroundColor: bgColor.withOpacity(0.15),
          ),
          SizedBox(height: 4.0),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            softWrap: true,
          )),
        ]),
      ),
    );
  }
}
