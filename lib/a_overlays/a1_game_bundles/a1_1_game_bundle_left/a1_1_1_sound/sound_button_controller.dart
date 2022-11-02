import 'dart:async';

import 'package:flame_audio/flame_audio.dart';
import '../../../../e_game_controllers/base_controller.dart';
import '../../../../z_globals/z4_assets_manager.dart';

class GameSoundController extends BaseController {
  //late DiabeteGameBase game;

  late String currentSoundTrack;
  late bool _soundEnabled = true;
  late bool _soundBeforePause = true;

//utiliser par le gameBase

  //late String _poolSound;
  final List<String> tracks = [
    GameAudioAssets.ukulele,
    GameAudioAssets.adventure,
    GameAudioAssets.funday,
    GameAudioAssets.goinghigher,
    GameAudioAssets.happyrock,
    GameAudioAssets.hipjazz,
    GameAudioAssets.onceagain,
    GameAudioAssets.perception,
    GameAudioAssets.smile,
  ];

  late StreamController<String> _streamSoundController;
  late StreamController<bool> _streamSoundEnabledController;

  Stream<String> get outputSoundTrack => _streamSoundController.stream;
  Stream<bool> get outputEnableSound => _streamSoundEnabledController.stream;
  Sink<bool> get inputPlayMusic => _streamSoundEnabledController.sink;
  Sink<bool> get inputEnableSound => _streamSoundEnabledController.sink;

  bool get soundEnabled => _soundEnabled;

  @override
  void start() {
    FlameAudio.bgm.initialize();
    _streamSoundController = StreamController<String>.broadcast();
    _streamSoundEnabledController = StreamController<bool>.broadcast();
  }

  void setSound(bool flag) {
    _soundEnabled = flag;
    _soundBeforePause = flag;
    inputPlayMusic.add(flag);
    if (_soundEnabled) {
      FlameAudio.bgm.play(currentSoundTrack);
    } else {
      FlameAudio.bgm.stop();
    }
  }

  void gamePauseState(bool gamePauseState) {
    if (gamePauseState && _soundBeforePause) {
      FlameAudio.bgm.pause();
    } else if (!gamePauseState && _soundBeforePause) {
      FlameAudio.bgm.resume();
    }
  }

  void gameChangeScene(String soundTrackScene) {
    currentSoundTrack = soundTrackScene;
    if (_soundEnabled) {
      FlameAudio.bgm.stop();
      FlameAudio.bgm.play(currentSoundTrack);
    }
  }

  @override
  void dispose() {
    _streamSoundController.close();
    _streamSoundEnabledController.close();
    FlameAudio.bgm.dispose();
  }
}
