import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/widgets/spec_appbar.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            kSizedBox,
            const SpecAppBar("Scan & Pay",true),
            SizedBox(height:20.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Image.asset("assets/images/scan.png",fit: BoxFit.cover,),
            ),
            kSizedBox,
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload QR"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
              ),
            ),
            kSizedBox,
            Center(child: Text("or")),
            kSizedBox,
            ElevatedButton(
              onPressed: () {},
              child: Text("Scan QR"),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0)),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColorDark),
              ),
            ),
          ],
        );
  }
}
