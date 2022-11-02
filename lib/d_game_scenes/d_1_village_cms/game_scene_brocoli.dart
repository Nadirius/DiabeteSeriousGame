import 'package:flame/components.dart';
import 'package:seriousgame/d_game_scenes/game_scene_generator.dart';

import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_1_sound/sound_button_controller.dart';
import '../../b_game_objects/b1_characters/brocoli.dart';
import '../../b_game_objects/b1_characters/brocoli_son.dart';
import '../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z4_assets_manager.dart';

/// Loader of the different scenes in the game
class DiabeteGameSceneBorocoli extends DiabeteGameScene {
  // Scene components list

  //###########################################

  bool etape1 = true;
  bool etape2 = false;
  bool etape3 = false;
  bool etape4 = false;

  bool etape1IsDone = false;
  bool etape2IsDone = false;
  bool etape3IsDone = false;

  // SCENE COMPONENT LIFECYCLE HANDLING SECTION

  DiabeteGameSceneBorocoli({
    required String sceneTmx,
    required String sceneName,
    required String previousMissionName,
    required GameScenesController gameScenesController,
    required String soundTrackName,
    required GameSoundController gameSoundController,
  }) : super(
          sceneTmx: sceneTmx,
          soundTrackName: soundTrackName,
          previousMissionName: previousMissionName,
          gameScenesController: gameScenesController,
          gameSoundController: gameSoundController,
          sceneName: sceneName,
        );

  /// Initiate the scene loader
  @override
  Future<void> onLoad() async {
    initBrocoli();
    initBrocoliSon();
    await super.onLoad();
    continueInitialisation();
  }

  /// Init the Brocoli in the scene
  void initBrocoli() {
    brocoli = Brocoli(GameImageAssets.user)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.bottomCenter;
  }

  /// Init the BrocoliSon in the scene
  void initBrocoliSon() {
    brocoliSon = BrocoliSon(GameImageAssets.user)
      ..size = Vector2.all(GameParams.middleSize)
      ..anchor = Anchor.bottomCenter;
  }

  void continueInitialisation() {
    brocoli
      ..debugMode = false
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
    brocoliSon
      ..debugMode = false
      ..mapWidth = mapWidth
      ..mapHeight = mapHeight;
  }

  //#####################################

  @override
  void update(double dt) {
    super.update(dt);
    if (etape1IsDone) {
      etape1 = false;
      etape2 = true;
      etape1IsDone = false;
    }
    if (etape2IsDone) {
      etape2 = false;
      etape3 = true;
      etape2IsDone = false;
    }
    if (etape3IsDone) {
      etape3 = false;
      etape4 = true;
      etape3IsDone = false;
    }
  }
}
