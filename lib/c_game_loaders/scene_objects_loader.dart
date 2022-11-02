import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';

import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/change_scene.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/fountain.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/fridge.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/house.dart';
import '../b_game_objects/b2_map_objects/b2_1_interactive_objects/tv.dart';
import '../b_game_objects/b2_map_objects/b2_2_obstacles/obstacle.dart';
import '../b_game_objects/b2_map_objects/map_object.dart';
import '../d_game_scenes/game_scene_generator.dart';
import '../z_globals/z0_tiled_strings.dart';
import '../z_globals/z1_game_manager.dart';
import '../z_globals/z3_strings_manager.dart';

/// Loader for game scene changes
class GameSceneLoader {
  static void loadSceneComponents({
    required TiledComponent sceneMap,
    required DiabeteGameScene game,
  }) {
    for (String objectsGroupName in tiledObjectsGroupsNames) {
      ObjectGroup? loadedObjectsGroup =
          sceneMap.tileMap.getLayer<ObjectGroup>(objectsGroupName);
      switch (loadedObjectsGroup!.name) {
        case TiledObjectsGroupName.obstacles:
          loadObstacles(loadedObjectsGroup, game);
          break;
        case TiledObjectsGroupName.spawnPoints:
          loadSpawnPoints(loadedObjectsGroup, game);
          break;
        case TiledObjectsGroupName.changeScenePoints:
          loadChangeScenes(loadedObjectsGroup, game);
          break;
        default:
      }
    }
  }

  //##############################################
  // LOADING OBSTACLES SECTION
  /// Parent method to load all types of obstacles from Tiled
  static void loadObstacles(ObjectGroup obstaclesGroup, DiabeteGameScene game) {
    for (var obstacle in obstaclesGroup.objects) {
      switch (obstacle.class_) {
        case TiledObjectClass.obstacle:
          game.addToScene(
            initObject(
              Obstacle(
                  isHavaingCollisionShapePolygone: false,
                  polygonePoints: obstacle.polygon),
              obstacle,
            ),
          );

          break;
        case TiledObjectClass.interactive:
          loadInteractiveObject(obstacle, game);
          break;
        case TiledObjectClass.house:
          loadHouse(obstacle, game);
          break;
        default:
      }
    }
  }

  /// Load interactive object from Tiled
  static void loadInteractiveObject(
      TiledObject interactive, DiabeteGameScene game) {
    switch (interactive.name) {
      case TiledObjectName.tv:
        game.addToScene(
          initObject(
            TV(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );

        break;
      case TiledObjectName.fountain:
        game.addToScene(
          initObject(
            Fountain(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );

        break;
      case TiledObjectName.fridge:
        game.addToScene(
          initObject(
            Fridge(
                isHavaingCollisionShapePolygone: false,
                polygonePoints: interactive.polygon),
            interactive,
          ),
        );

        break;
      default:
    }
  }

  /// Load house object from Tiled
  static void loadHouse(TiledObject house, DiabeteGameScene game) {
    switch (house.name) {
      case TiledObjectName.brocoliHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.brocoliHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      case TiledObjectName.moutardeHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.moutardeHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      case TiledObjectName.myrtilleHouse:
        game.addToScene(
          initObject(
            House(
                collisionMessage: MapCollisionInteractWith.myrtilleHouse,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: house.polygon),
            house,
          ),
        );
        break;
      default:
    }
  }

  //######################################################

  //##############################################
  // LOADING SPAWN POINTS SECTION
  /// Load spawn points from Tiled
  static void loadSpawnPoints(
      ObjectGroup spawnPointsGroup, DiabeteGameScene game) {
    for (var spawnPoint in spawnPointsGroup.objects) {
      switch (spawnPoint.name) {
        case TiledObjectName.player:
          game.player.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.player);
          break;
        case TiledObjectName.moutarde:
          break;
        case TiledObjectName.myrtille:
          break;
        case TiledObjectName.brocoli:
          game.brocoli.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.brocoli);
          break;
        case TiledObjectName.brocoliSon:
          game.brocoliSon.position = Vector2(spawnPoint.x, spawnPoint.y);
          game.addToScene(game.brocoliSon);
          break;
        default:
      }
    }
  }

  //######################################################

  //##############################################
  // LOADING CHANGE SCENES SECTION
  /// Load changing scenes objects from Tiled
  static void loadChangeScenes(
      ObjectGroup changeScenesGroup, DiabeteGameScene game) {
    for (var changeScene in changeScenesGroup.objects) {
      switch (changeScene.name) {
        case TiledObjectName.toVillage1:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.villageCMS,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;
        case TiledObjectName.toVillage2:
          break;
        case TiledObjectName.toMoutardeHouse:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atMoutardeHome,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );

          break;
        case TiledObjectName.toBrocoliHouse:
          game.addToScene(
            initObject(
              ChangeScenePoint(
                toScene: GameScenes.atBrocoliHome,
                isHavaingCollisionShapePolygone: false,
                polygonePoints: changeScene.polygon,
                gameScenesController: game.gameScenesController,
              ),
              changeScene,
            ),
          );
          break;

        case TiledObjectName.toMyrtilleHouse:
          break;
        default:
      }
    }
  }
  //######################################################

  /// Component initialisation
  static MapObject initObject(MapObject mapObject, TiledObject object) {
    return mapObject
      ..position = Vector2(object.x, object.y)
      ..width = object.width
      ..height = object.height
      ..debugMode = false;
  }

  /// List of Tiled mapping
  static List<String> tiledObjectsGroupsNames = [
    TiledObjectsGroupName.obstacles,
    TiledObjectsGroupName.spawnPoints,
    TiledObjectsGroupName.changeScenePoints,
  ];
}
