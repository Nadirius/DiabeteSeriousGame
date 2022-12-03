import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../../z_globals/z3_strings_manager.dart';
import '../../b1_characters/player.dart';
import '../map_object.dart';

/// Object concerning the changing scene point defined on Tiled
class ChangeScenePoint extends MapObjectBody {
  bool _hasCollided = false;
  String toScene;

  ChangeScenePoint({
    required this.toScene,
    required MapObject mapObject,
  }) : super(
          mapObject: mapObject,
        );

  /// Loading the next scene when the playing starts the collision
  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is PersoBaseBodyPlayer) {
      print("Collision");
      if (!_hasCollided) {
        if (gameRef.canChangeScene) {
          loadNextScene();
        } else {
          // Display dialog that the player can't leave scene
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
                isShowDialog: true, dialogMessage: GameDialogs.cantLeaveScene),
          );
        }
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
    if (other is PersoBaseBodyPlayer) {
      _hasCollided = false;
    }
  }

  /// Stop the old scene and load the new one
  void loadNextScene() {
    gameRef.stopScene();
    gameRef.gameScenesController.goToScene(toScene);
  }
}
