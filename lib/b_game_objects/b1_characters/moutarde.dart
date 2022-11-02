import 'package:flame/components.dart';

import 'perso_base.dart';

/// This class manager M. Moutarde. Moutarde inherits from perso (perso_base.dart)
class Moutarde extends Perso {
  Moutarde() : super(fileNamePngCharacter: "");

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    x + 1;
  }
}
