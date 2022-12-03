import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:seriousgame/d_game_scenes/game_base.dart';

import '../../z_globals/z1_game_manager.dart';

abstract class PersoBaseBody<T extends DiabeteGameBase> extends BodyComponent<T>
    with ContactCallbacks {
  Perso charachter;
  BodyType bodyType;
  PersoBaseBody({
    required this.charachter,
    this.bodyType = BodyType.kinematic,
  });

  @override
  Body createBody() {
    debugMode = PlayerBehavior.debugmode; //prevent debug drawing

    final shape = PolygonShape();
    shape.setAsBoxXY(charachter.width / 4, charachter.height / 4);
    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.9,
      density: 0.5,
    );

    final bodyDef = BodyDef()
      ..position = Vector2(charachter.position.x, charachter.position.y)
      ..type = bodyType
      ..userData = this;
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
  }

  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
  }
}

/// This class is a template for all characters  (heritage)
class Perso extends SpriteAnimationComponent {
  Perso({required this.fileNamePngCharacter});

  String fileNamePngCharacter;

// idleAnimation --> positions at the stop of the player
// moveAnimation --> positions when player is moving
  late SpriteAnimation idleDownAnimation;
  late SpriteAnimation idleUpAnimation;
  late SpriteAnimation idleRightAnimation;
  late SpriteAnimation idleLeftAnimation;
  late SpriteAnimation moveDownAnimation;
  late SpriteAnimation moveUpAnimation;
  late SpriteAnimation moveRightAnimation;
  late SpriteAnimation moveLeftAnimation;

//##############################################################################
  // UPDATE SECTION
  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    final spriteSheet = await initSprite();
    loadAnimations(spriteSheet);
    animation = idleDownAnimation;
  }

  // END UPDATE SECTION
//##################################################################

  Future<SpriteSheet> initSprite() async {
    return SpriteSheet(
      image: await Flame.images.load(fileNamePngCharacter),
      srcSize: Vector2(GameParams.characterSprite, GameParams.characterSprite),
    );
  }

  /// This methode load the annimation of the player in the sprite Sheet
  void loadAnimations(SpriteSheet spriteSheet) {
    idleDownAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleUpAnimation = spriteSheet.createAnimation(
      row: 1,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleRightAnimation = spriteSheet.createAnimation(
      row: 2,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    idleLeftAnimation = spriteSheet.createAnimation(
      row: 3,
      stepTime: PlayerBehavior.speedOnIdle,
      to: 7,
    );
    moveDownAnimation = spriteSheet.createAnimation(
      row: 4,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveUpAnimation = spriteSheet.createAnimation(
      row: 5,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveRightAnimation = spriteSheet.createAnimation(
      row: 6,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
    moveLeftAnimation = spriteSheet.createAnimation(
      row: 7,
      stepTime: PlayerBehavior.speedOnMove,
      to: 7,
    );
  }
}
