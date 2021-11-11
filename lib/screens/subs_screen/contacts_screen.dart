import 'package:flutter/material.dart';
import 'package:payments_app/constants/constants.dart';
import 'package:payments_app/providers/person_provider.dart';
import 'package:payments_app/widgets/contact_tile.dart';
import 'package:payments_app/widgets/spec_appbar.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  static const routeName = "/ContactScreen";
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Persons>(context);
    final persons = data.persons;
    final fav = data.showFavourites;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kSizedBox,
              const SpecAppBar("My Contacts",false),
              kSizedBox,
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Favourites",textAlign: TextAlign.left,),
              ),
              kSizedBox,
              Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: fav.length,
                    itemBuilder: (context, index) =>
                        ChangeNotifierProvider.value(
                          value: fav[index],
                          child: FavouriteTile(),
                        ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("All Contacts"),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.47,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: persons.length,
                    itemBuilder: (context, index) => ChangeNotifierProvider.value(
                          value: persons[index],
                          child: ContactTile(),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
