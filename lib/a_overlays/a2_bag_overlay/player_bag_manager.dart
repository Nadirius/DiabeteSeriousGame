import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';

import '../../d_game_scenes/game_base.dart';
import '../../e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import 'a2_0_bag_ui_material/tabs_bar.dart';
import 'a2_1_care_equipment/care_equipment.dart';
import 'a2_2_day_program/day_program_manager.dart';
import 'a2_3_care_scenario/care_situation_manager.dart';
import 'a2_4_professional_contacts/contact_controller.dart';
import 'a2_4_professional_contacts/contacts_manager.dart';
import 'a2_5_learning_badges/learning_badges.dart';

/// This class manages the overlay that appears when you click on the bag in the right bundle.
class PlayerBag extends StatelessWidget {
  final DiabeteGameBase game;
  final PlayerBagController playerBagController;
  final ContactsController contactsController;

  const PlayerBag({
    super.key,
    required this.game,
    required this.playerBagController,
    required this.contactsController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(100),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 600,
          height: 600,
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
                bottom: getTabBar(),
                title: const Text(BagMenu.titleWidget),
                actions: [
                  IconButton(
                      hoverColor: Colors.deepOrange,
                      onPressed: playerBagController.closeBag,
                      icon: const Icon(
                        Pixel.close,
                        color: Colors.white,
                      ))
                ],
              ),
              body: TabBarView(
                children: <Widget>[
                  const CareEquipment(),
                  const DayPlanning(),
                  CareSituation(),
                  ProfessionalContacts(
                    playerBagController: playerBagController,
                    game: game,
                    contactsController: contactsController,
                  ),
                  const LearningBadges(),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
