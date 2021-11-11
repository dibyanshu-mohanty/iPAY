import 'package:flutter/material.dart';
import 'package:payments_app/data/settings_data.dart';
import 'package:payments_app/screens/subs_screen/splash_screen.dart';
import 'package:payments_app/widgets/spec_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SpecAppBar("Settings", true),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context,index) =>
                ListTile(
                  leading: settings[index]['icon'],
                  title: Text(settings[index]['name']),
                  trailing: InkWell(
                      onTap: (){

                      },
                      child: const Icon(Icons.arrow_forward_ios)),
                )
          ),
        ),
      ],
    );
  }
}
