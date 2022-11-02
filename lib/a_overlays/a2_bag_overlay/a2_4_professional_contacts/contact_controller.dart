import 'dart:async';

import '../../../e_game_controllers/base_controller.dart';

import '../../../z_globals/z10_contact_manager.dart';
import 'a2_4_1_contacts_ui_material/contact_model.dart';

/// Contacts controller
import '../../../z_globals/z10_contact_manager.dart';
import 'a2_4_1_contacts_ui_material/contact_model.dart';

class ContactsController extends BaseController {
  late StreamController<List<dynamic>> _streamContactController;

  Stream<List<dynamic>> get outputReachableContact =>
      _streamContactController.stream;

  final Map<String, ContactModel> _contactMap = {
    "Urgences médicales": ContactModel(
      name: "Urgences médicales",
      phoneNumber: "144",
      image: "urgence.png",
      hasDialogList: true,
      listDialog: urgence,
    ),
    "Médecin": ContactModel(
      name: "Médecin traitant",
      phoneNumber: "+41 786 65 85",
      image: "medecin.png",
    ),
    "Bureau": ContactModel(
      name: "Bureau du CMS",
      phoneNumber: "+41 786 65 87",
      image: "cms.png",
    ),
    "Diététicienne": ContactModel(
      name: "Diététicienne",
      phoneNumber: "+41 786 65 86",
      image: "dieteticiene.png",
    ),
    "Physiothérapeute": ContactModel(
      name: "Physiothérapeute en réadaptation cardiovasculaire",
      phoneNumber: "+41 786 65 89",
      image: "physio.png",
    ),
    "Infirmiere": ContactModel(
      name: "Infirmiere de liaison",
      phoneNumber: "+41 786 65 87",
      image: "infirmiere.png",
    ),
    "Tabacologue": ContactModel(
      name: "Tabacologue",
      phoneNumber: "+41 786 65 88",
      image: "tabacologue.png",
    ),
    "Aumômier": ContactModel(
      name: "Aumômier",
      phoneNumber: "+41 745 56 21",
      image: "aumonier.png",
    ),
  };
  Map<String, ContactModel> get contactMap => _contactMap;

  @override
  void start() {
    _streamContactController = StreamController<List<dynamic>>.broadcast();
  }

  @override
  void dispose() {
    _streamContactController.close();
  }
}
