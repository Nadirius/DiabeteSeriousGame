import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../../b1_characters/player.dart';
import '../map_object.dart';

/// Fountain object
class Fountain extends MapObjectBody {
  bool _hasCollided = false;

  Fountain({
    List<Point>? polygonePoints,
    required MapObject mapObject,
  }) : super(
          mapObject: mapObject,
        );

  /// Nothing more than a collision happens when the player touches the fountain
  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        // gameRef.player.dialogController.inputDialog.add(
        //     DialogModel(isShowDialog: true, dialogMessage: collisionMessage));
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
    if (other is PlayerComponent) {
      _hasCollided = false;
    }
  }
}
