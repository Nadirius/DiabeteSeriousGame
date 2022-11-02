import 'package:flame/components.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../b1_characters/player.dart';
import '../map_object.dart';

/// Fridge object
class Fridge extends MapObject {
  bool _hasCollided = false;

  Fridge({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        gameRef.gameScenesController.gameDialogController.inputDialog.add(
          DialogModel(
              isShowDialog: true,
              dialogMessage:
                  "Hummm, je prendrai bien une petite biere en attendant Mr Moutarde !"),
        );
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
      gameRef.isDone = true;
      gameRef.canChangeScene = true;
    }
    super.onCollisionEnd(other);
  }
}
