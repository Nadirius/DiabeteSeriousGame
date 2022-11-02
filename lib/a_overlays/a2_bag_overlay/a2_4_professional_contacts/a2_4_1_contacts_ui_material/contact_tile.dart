import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';

import '../contact_controller.dart';
import 'contact_model.dart';

/// Contact tile widget
class ContactTile extends StatelessWidget {
  const ContactTile(
      {required this.contactsController,
      required this.contact,
      required this.onTap,
      super.key});

  final VoidCallback onTap;
  final ContactModel contact;
  final ContactsController contactsController;

  @override
  Widget build(BuildContext context) {
    print("ListTile ${contact.name}, ${contact.isReachable}}");
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("images/${contact.image}"),
        backgroundColor: Colors.transparent,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phoneNumber),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: contact.isReachable!
            ? const Icon(
                Pixel.cellularsignal3,
                color: Colors.green,
              )
            : const Icon(
                Pixel.cellularsignaloff,
                color: Colors.green,
              ),
      ),
      enabled: true,
      onTap: onTap,
    );
  }
}
