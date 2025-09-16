import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final Contact contact;

  // Aufgabe:
  // Baue eine Visitenkarte die ansprechend Designed ist und die Felder von der Klasse Contact darstellt.
  // Zusatz: laden der AvatarUrl als Bild

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(), color: Colors.grey[200], borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          // Image.asset('images/sticker.png', fit: BoxFit.scaleDown, height: 100, width: 100),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage('https://picsum.photos/200')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contact.firstAndLastName, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('position'),
              Row(children: [Text('tel;'), Text('112133211')]),
              Row(children: [Text('mail;'), Text('qasd@web.de')]),
            ],
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String lastName;
  final String firstName;
  final String postion;
  final String phoneNumber;
  final String mailAdress;
  final String avatarUrl;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.postion,
    required this.phoneNumber,
    required this.mailAdress,
    required this.avatarUrl,
  });

  String get firstAndLastName => '$lastName, $firstName';
}
