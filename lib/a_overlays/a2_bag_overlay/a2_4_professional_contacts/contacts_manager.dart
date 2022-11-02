import 'package:flutter/material.dart';

import '../../../d_game_scenes/game_base.dart';
import '../../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import '../../../y_common_widgets/show_alert_dialog.dart';
import '../../a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import 'a2_4_1_contacts_ui_material/contact_model.dart';
import 'a2_4_1_contacts_ui_material/contact_tile.dart';
import 'contact_controller.dart';

/// Professional contacts widget
class ProfessionalContacts extends StatelessWidget {
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;
  final ContactsController contactsController;

  const ProfessionalContacts({
    Key? key,
    required this.game,
    required this.contactsController,
    required this.playerBagController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactList =
        contactsController.contactMap.entries.map((e) => e.value).toList();
    return ListView.separated(
      itemCount: contactList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == contactList.length + 1) {
          return Container();
        }
        return ContactTile(
          contact: contactList[index - 1],
          onTap: () {
            final contact = contactList[index - 1];
            debugPrint(contact.isReachable.toString());
            !contact.isReachable!
                ? showAlertDialog(
                    context,
                    title: contact.name,
                    content: contact.defaultDialog,
                    defaultActionText: "OK",
                  )
                : _displayContactMessage(contact);
          },
          contactsController: contactsController,
        );
      },
    );
  }

  /// Display the contact dialog or dialog list
  _displayContactMessage(ContactModel contact) {
    game.gameScenesController.bagController.closeBag();
    game.player.canMove = false;
    Future.delayed(const Duration(milliseconds: 500), () {
      game.gameScenesController.gameDialogController.onDialog(
        DialogModel(
          dialogMessage: "Appel de la centrale d'urgence \n\n"
              "..............................................................",
          isShowDialog: true,
          isTransition: true,
        ),
      );
    });

    Future.delayed(const Duration(seconds: 3), () {
      contact.hasDialogList
          ? game.gameScenesController.gameDialogController
              .onDialogList(contact.listDialog!)
          : game.gameScenesController.gameDialogController
              .onDialog(contact.oneDialog!);
    });
  }
}
