import 'dart:async';
import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_1_sound/sound_button_controller.dart';
import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_3_configuration/config_button_controller.dart';
import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_controller.dart';
import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../a_overlays/a2_bag_overlay/a2_4_professional_contacts/contact_controller.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_brocoli.dart';
import '../../d_game_scenes/game_base.dart';
import '../../d_game_scenes/game_scene_generator.dart';
import '../../d_game_scenes/start_page_scene.dart';
import '../../z_globals/z1_game_manager.dart';
import '../../z_globals/z3_strings_manager.dart';
import '../../z_globals/z4_assets_manager.dart';
import '../base_controller.dart';
import '../e_2_score_controller/player_score_controller.dart';
import '../e_3_bag_controller/player_bag_controller.dart';

/// Controller for game scenes
class GameScenesController extends BaseController {
  //Game Controllers
  late GameSoundController gameSoundController;
  late PlayerBagController bagController;
  late PlayerScoreController scoreController;
  late GameDialogController gameDialogController;
  late ConfigButtonController configButtonController;
  late ContactsController contactsController;

  late DiabeteGameBase _currentScene;

  late Map<String, DiabeteGameBase> _sceneRouter;

  late StreamController<DiabeteGameBase> _gameScenesController;

  late Sink<DiabeteGameBase> _moveToNextScene;

  Stream<DiabeteGameBase> get currentScene => _gameScenesController.stream;

  DiabeteGameBase get scene => _currentScene;

  /// Launch the controller
  @override
  void start() {
    _gameScenesController = StreamController<DiabeteGameBase>();
    _moveToNextScene = _gameScenesController.sink;

    _sceneRouter = {
      GameScenes.startPage: StartPage(
        gameScenesController: this,
        gameSoundController: gameSoundController,
        soundTrackName: GameAudioAssets.goinghigher,
        sceneName: GameScenes.startPage,
        previousMissionName: '',
      ),
      GameScenes.villageCMS: DiabeteGameScene(
        sceneName: GameScenes.villageCMS,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.village1,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.funday,
        gameSoundController: gameSoundController,
      ),
      GameScenes.hospital: DiabeteGameScene(
        sceneName: GameScenes.hospital,
        previousMissionName: GameScenes.villageCMS,
        sceneTmx: GameTilesAssets.village1,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.funday,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atMoutardeHome: DiabeteGameScene(
        sceneName: GameScenes.atMoutardeHome,
        previousMissionName: '',
        sceneTmx: GameTilesAssets.moutardeHome,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atMyrtilleHome: DiabeteGameScene(
        sceneName: GameScenes.atMyrtilleHome,
        previousMissionName: GameScenes.atMoutardeHome,
        sceneTmx: GameTilesAssets.moutardeHome,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
      GameScenes.atBrocoliHome: DiabeteGameSceneBorocoli(
        sceneName: GameScenes.atBrocoliHome,
        previousMissionName: GameScenes.atMyrtilleHome,
        sceneTmx: GameTilesAssets.brocoliHome,
        gameScenesController: this,
        soundTrackName: GameAudioAssets.adventure,
        gameSoundController: gameSoundController,
      ),
    };
    _currentScene = _sceneRouter[GameScenes.startPage]!;
  }

  /// Load new scene with router
  void goToScene(String gameScene) {
    final nextScene = _sceneRouter[gameScene]!;
    final nextScenePreviousMission =
        _sceneRouter[nextScene.previousMissionName];
/*         

    // If the scene has already been done, display dialog
    if (nextScene.isDone) {
      displayAccomplishedMissionMessage(gameScene);

      // The previous scene isn't done (expect if you want to go to Village)
    } else if (nextScene.previousMissionName != '' &&
        !nextScenePreviousMission!.isDone) {
      displayMustAccomplishPrevisousMissionMessage(gameScene);
    } else {
      changeToNextScene(nextScene);
    } */
    changeToNextScene(nextScene);
  }

  void changeToNextScene(DiabeteGameBase nextScene) {
    _currentScene = nextScene;

    // Once we enter the scene, we can't leave until we finish the mission
    if (_currentScene.sceneName != GameScenes.villageCMS) {
      _currentScene.canChangeScene = false;
    }

    _moveToNextScene.add(_currentScene);
    gameSoundController.gameChangeScene(_currentScene.soundTrackName);
    bagController.game = _currentScene;

    try {
      _currentScene.resumeScene();
    } catch (e) {
      // will be solved by scheduler
    }
  }

  void displayMustAccomplishPrevisousMissionMessage(String gameScene) {
    switch (gameScene) {
      // You want to visit Mme Myrtille before Mr Moutarde
      case GameScenes.atMyrtilleHome:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.visitMoutardeBefore),
        );
        break;
      // You want to visit Mr Brocoli before Mme Myrtille
      case GameScenes.atBrocoliHome:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.visitMyrtilleBefore),
        );
        break;
      case GameScenes.hospital:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true, dialogMessage: GameDialogs.finishCMSBefore),
        );
        break;
    }
  }

  void displayAccomplishedMissionMessage(String gameScene) {
    switch (gameScene) {
      case GameScenes.atMoutardeHome:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToMoutardeHome),
        );
        break;
      case GameScenes.villageCMS:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToVillageCMS),
        );
        break;
      default:
        gameDialogController.onDialog(
          DialogModel(
              isShowDialog: true,
              dialogMessage: GameDialogs.returnToDefaultScene),
        );
    }
  }

  /// call existing scene with router
  void openScene(String gameScene) {
    switch (gameScene) {
      case GameScenes.villageCMS:
        _currentScene = _sceneRouter[gameScene]!;
        _moveToNextScene.add(_currentScene);
        gameSoundController.gameChangeScene(_currentScene.soundTrackName);
        bagController.game = _currentScene;
        Future.delayed(const Duration(milliseconds: 1500), () {
          gameDialogController
              .sendInitialMessage(GameDialogs.initialVillageMesssage);
        });
        scene.soundState = true;

        break;
    }
  }

  /// Ends the controller
  @override
  void dispose() {
    _gameScenesController.close();
  }
}
