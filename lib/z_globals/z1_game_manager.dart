/// It's in this class that the behaviors of the player is managed
class PlayerBehavior {
  static const double speedOnMove = .15;
  static const double speedOnIdle = .2;
  static double strideLength = 120; // longueur des pas du player (en pixel)
  static const int noCollision = -1;
  static const int initialScore = 50;

  // Movement params
  static const int isIdleDown = 0;
  static const int isIdleUp = 1;
  static const int isIdleRight = 2;
  static const int isIdleLeft = 3;
  static const int isMovingDown = 4;
  static const int isMovingUp = 5;
  static const int isMovingRight = 6;
  static const int isMovingLeft = 7;
}

/// It's in this class that the global game setting is managed
class GameParams {
  static const double smallSize = 30;
  static const double middleSize = 50;
  static const double bigSize = 60;
  static const double spriteSize = 16;
  static const double characterSprite = 32;
}

/// It's in this class that the global scene setting is managed
class GameScenes {
  static const String startPage = "startPage";
  static const String villageCMS = "CMS - Village1 -";
  static const String hospital = "Hospital - Village2 -";
  static const String atMoutardeHome =
      "Mission 1 : CMS - Village1 - Moutarde Home";
  static const String atMyrtilleHome =
      "Mission 2 : CMS - Village1 - Myrtille Home";
  static const String atBrocoliHome =
      "Mission 3 : CMS - Village1 - Brocoli Home";
}

/// It's in this class that the bag menu strings are managed
class BagMenu {
  static const String titleWidget = 'Sac à dos';
}
