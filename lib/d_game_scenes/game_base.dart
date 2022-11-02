import 'package:flame/game.dart';
import 'package:seriousgame/a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_1_sound/sound_button_controller.dart';

import '../b_game_objects/b1_characters/brocoli.dart';
import '../b_game_objects/b1_characters/brocoli_son.dart';
import '../b_game_objects/b1_characters/player.dart';
import '../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';

abstract class DiabeteGameBase extends FlameGame with SingleGameInstance {
  DiabeteGameBase({
    required this.gameSoundController,
    required this.soundTrackName,
    required this.gameScenesController,
    required this.sceneName,
    required this.previousMissionName,
  });

  // Scene name
  String sceneName;

  String previousMissionName;

  // Scene sound
  String soundTrackName;
  bool soundState = false;

  // To allow the perso to change the scene
  bool canChangeScene = true;

  // When the scenario of the scene is done, set to true
  // Logic : Can't return to a scene already done
  bool isDone = false;

  // Player scene
  late final PlayerComponent player;

  // Scenes character
  // CMS Moutarde
  // CMS Myrtille
  //CMS Brocoli
  late final Brocoli brocoli;
  late final BrocoliSon brocoliSon;

  // Game controller
  GameScenesController gameScenesController;

  // Sound Controller
  GameSoundController gameSoundController;

  @override
  Future<void> onLoad() async {
    gameSoundController.currentSoundTrack = soundTrackName;
  }

  void resumeScene() {}
}