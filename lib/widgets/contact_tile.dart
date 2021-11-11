import 'package:flutter/material.dart';
import 'package:payments_app/models/person.dart';
import 'package:payments_app/screens/payment_screen/contact_payment_screen.dart';
import 'package:provider/provider.dart';

class FavouriteTile extends StatelessWidget {
  // final String id;
  // final String name;
  // final String imageUrl;
  // const FavouriteTile({required this.name, required this.id, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final favPerson = Provider.of<Person>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ContactPaymentScreen.routeName, arguments: favPerson.id);
      },
      child: Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            CircleAvatar(
              child: Image.asset(
                favPerson.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                favPerson.name,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final person = Provider.of<Person>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ContactPaymentScreen.routeName, arguments: person.id);
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(
            person.imageURL,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(person.name),
        subtitle: Text(person.phoneNumber),
        trailing: IconButton(
            onPressed: () {
              person.toggleFavourites();
            },
            icon: person.isFavourite
                ? const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                : const Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  )),
      ),
    );
  }
}
