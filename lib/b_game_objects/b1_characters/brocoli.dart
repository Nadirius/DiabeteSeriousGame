import 'package:flame/components.dart';

import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_brocoli.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager M. Brocoli. Brocoli inherits from perso (perso_base.dart)
class Brocoli extends Perso with HasGameRef<DiabeteGameSceneBorocoli> {
  Brocoli(String user) : super(fileNamePngCharacter: GameImageAssets.user);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.etape1) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part1);
          gameRef.etape1IsDone = true;
        } else if (gameRef.etape2) {
          gameRef.gameScenesController.gameDialogController.onDialog(
              DialogModel(
                  isShowDialog: true, dialogMessage: "Je suis en colère"));
        } else if (gameRef.etape3) {
          gameRef.gameScenesController.gameDialogController.onDialog(
              DialogModel(
                  isShowDialog: true,
                  dialogMessage: "Laissez moi tranquille !"));
        }
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }

  final dialogsMission3Part1 = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Infirmière: \n\n"
          "Bonjour, c’est Margot, l’infirmière du CMS, comment allez-vous ?\n",
      hasNext: true,
      index: 0,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Patient: \n\n"
          "Sortez de chez moi, étrangère !\n",
      hasNext: true,
      index: 1,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Vous constatez que le patient est confus et agressif. Il ne souhaite pas communiquer avec vous ce matin. \n"
          "\nPeut-être que son fils pourrait vous aider... \n",
      hasNext: false,
      index: 2,
    )
  ];
}
