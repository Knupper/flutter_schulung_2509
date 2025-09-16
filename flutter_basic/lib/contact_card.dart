import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final Contact contact;

  // Aufgabe:
  // Telefonummer und Mail sollten untereinander anfangen
  // Mail:            meineMail@web.de
  // Telefon:         014253541

  @override
  Widget build(BuildContext context) {
    print('build - ${contact.firstAndLastName}');
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
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.firstAndLastName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text('position' * 33),
                _InformationRow(
                  label: 'Telefon',
                  child: Text(contact.phoneNumber, style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                _InformationRow(
                  label: 'Mail',
                  child: Text(contact.mailAdress, style: TextStyle(color: Colors.greenAccent)),
                ),
                _InformationRow(
                  label: 'Tolle Info',
                  child: Container(color: Colors.redAccent, height: 50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InformationRow extends StatelessWidget {
  const _InformationRow({super.key, required this.label, required this.child});
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: Text(label)),
        Expanded(flex: 8, child: child),
      ],
    );
  }
}

class Contact {
  final String lastName;
  final String firstName;
  final String position;
  final String phoneNumber;
  final String mailAdress;
  final String avatarUrl;

  Contact({
    required this.lastName,
    required this.firstName,
    required this.position,
    required this.phoneNumber,
    required this.mailAdress,
    required this.avatarUrl,
  });

  String get firstAndLastName => '$lastName, $firstName';
}
