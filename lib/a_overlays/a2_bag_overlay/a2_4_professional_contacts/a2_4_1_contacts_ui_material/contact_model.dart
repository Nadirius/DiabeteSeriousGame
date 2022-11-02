import '../../../a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';

/// Contact model
class ContactModel {
  String name;
  String phoneNumber;
  String? image;
  String defaultDialog;
  String? singleDialog;
  bool hasDialogList;
  List<DialogModel>? listDialog;
  DialogModel? oneDialog;
  bool? isReachable;

  ContactModel(
      {required this.name,
      required this.phoneNumber,
      this.oneDialog,
      this.image,
      this.hasDialogList = false,
      this.listDialog,
      this.singleDialog,
      this.defaultDialog =
          "Vous n'êtes pas entrain de joindre le contact adapté à la situation.",
      this.isReachable = false});
}
