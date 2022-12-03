// ignore: depend_on_referenced_packages
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:tiled/tiled.dart';

import '../../b1_characters/player.dart';
import '../map_object.dart';

/// House object
class House extends MapObjectBody {
  final String collisionMessage;
  bool _hasCollided = false;
  House({
    required this.collisionMessage,
    List<Point>? polygonePoints,
    required MapObject mapObject,
  }) : super(
          mapObject: mapObject,
        );

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is PersoBaseBodyPlayer) {
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
    if (other is PersoBaseBodyPlayer) {
      _hasCollided = false;
    }
  }
}
