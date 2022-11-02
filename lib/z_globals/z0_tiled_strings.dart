/// It's in this class that tiled objects were defined by their group name
class TiledObjectsGroupName {
  static const String obstacles = "Obstacles";
  static const String spawnPoints = "SpawnPoints";
  static const String changeScenePoints = "ChangeScenePoints";
}

/// It's in this class that tiled objects were defined by their class
class TiledObjectClass {
  // ChangeScenePoints
  static const String changeScene = "ChangeScene";

  // Obstacles
  static const String obstacle = "Obstacle";
  static const String interactive = "Interactive";
  static const String house = "House";

  // SpawnPoints
  static const String spawnPoint = "SpawnPoint";
}

/// It's in this class that tiled objects were defined by their name
class TiledObjectName {
  // Characters (SpawnPoints -> SpawnPoint)
  static const String player = "Player";
  static const String moutarde = "Moutarde";
  static const String myrtille = "Myrtille";
  static const String brocoli = "Brocoli";
  static const String brocoliSon = "BrocoliSon";

  // CMS (Obstacles -> House)
  static const String brocoliHouse = "BrocoliHouse";
  static const String moutardeHouse = "MoutardeHouse";
  static const String myrtilleHouse = "MyrtilleHouse";

  // Interactive objects (Obstacles -> Interactive)
  static const String tv = "TV";
  static const String house = "House";
  static const String fountain = "Fountain";
  static const String fridge = "Fridge";

  // Change scene area (ChangeScenePoints -> ChangeScene)
  static const String toVillage1 = "ToVillage1";
  static const String toVillage2 = "ToVillage2";
  static const String toMoutardeHouse = "ToMoutardeHouse";
  static const String toMyrtilleHouse = "ToMyrtilleHouse";
  static const String toBrocoliHouse = "ToBrocoliHouse";
}
