// ignore: depend_on_referenced_packages
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:tiled/tiled.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../d_game_scenes/game_scene_generator.dart';
import '../../z_globals/z1_game_manager.dart';
import '../b1_characters/player.dart';

/// This abstract class describe the behavior of a standard object
/// that you can show on the map (house, tv, tree etc...)
///

abstract class MapObjectBody extends BodyComponent<DiabeteGameScene>
    with ContactCallbacks {
  MapObject mapObject;
  BodyType bodyType;

  MapObjectBody({
    required this.mapObject,
    this.bodyType = BodyType.dynamic,
  });

  @override
  Body createBody() {
    debugMode = PlayerBehavior.debugmode; //prevent debug drawing

    final shape = PolygonShape();
    shape.setAsBoxXY(mapObject.width / 4, mapObject.height / 4);
    final fixtureDef = FixtureDef(
      shape,
      friction: 0.3,
      density: 0.5,
    );

    final bodyDef = BodyDef()
      ..position = Vector2(mapObject.position.x, mapObject.position.y)
      ..type = bodyType
      ..userData = this;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  /// Get either the polygonHitbox or rectangleHitbox
  Component getHitBox() {
    if (mapObject.isHavaingCollisionShapePolygone) {
      List<Vector2> polygoneVectors = mapObject.polygonePoints
          ?.map((p) => Vector2(p.x, p.y))
          .toList() as List<Vector2>;

      return PolygonHitbox(polygoneVectors)
        ..collisionType = CollisionType.passive
        ..isSolid = true;
    }
    return RectangleHitbox.relative(Vector2(0.9, 0.9),
        parentSize: Vector2(mapObject.width, mapObject.height))
      ..collisionType = CollisionType.passive
      ..isSolid = true;
  }

  @override
  void beginContact(Object other, Contact contact) {
    print("collusion");
    super.beginContact(other, contact);
    if (other is PersoBaseBodyPlayer) {
      gameRef.player.collisionDirection =
          gameRef.player.playerMovementDirection;
      gameRef.player.setOnIdlePlayerDirection();
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
    if (other is PersoBaseBodyPlayer) {
      gameRef.player.collisionDirection = PlayerBehavior.noCollision;
    }
  }
}

class MapObject extends PositionComponent with HasGameRef<DiabeteGameScene> {
  final bool isHavaingCollisionShapePolygone;
  List<Point>? polygonePoints;
  MapObject({
    required this.isHavaingCollisionShapePolygone,
    this.polygonePoints,
  });
}
