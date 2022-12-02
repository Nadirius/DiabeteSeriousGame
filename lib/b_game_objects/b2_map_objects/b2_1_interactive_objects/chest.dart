// ignore_for_file: unused_field

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:seriousgame/d_game_scenes/game_scene_generator.dart';
import '../../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../b1_characters/player.dart';

/// This class defines what is a Chest and which behavior has a chest
///
enum ChestType { badge, scene }

class Chest extends SpriteComponent
    with CollisionCallbacks, HasGameRef<DiabeteGameScene> {
  String? badgeName;
  DialogModel? dialog;
  bool? hasListDialog;
  ChestType? chestType;
  List<DialogModel>? listDialog;

  Chest({
    required Sprite sprite,
    required Vector2 size,
    required Anchor anchor,
    this.badgeName,
    this.dialog,
    this.chestType = ChestType.scene,
    this.listDialog,
    this.hasListDialog = false,
  }) : super(
          sprite: sprite,
          size: size,
          anchor: anchor,
        );

  /// On loading the chest, we add the collision shape
  @override
  Future<void>? onLoad() async {
    add(RectangleHitbox.relative(Vector2(0.9, 0.9),
        parentSize: Vector2(width, height))
      ..collisionType = CollisionType.passive
      ..isSolid = true);
  }

  /// When the player collide with the chest, the chest is removed from the scene and the badge is unlocked.
  /// There are different types of badges, each one will appear in the badge menu of the bag.
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      gameRef.gameScenesController.gameDialogController.inputDialog.add(
        DialogModel(
          isShowDialog: true,
          dialogMessage: "Get it",
        ),
      );
      gameRef.remove(this);
    }
  }
}
