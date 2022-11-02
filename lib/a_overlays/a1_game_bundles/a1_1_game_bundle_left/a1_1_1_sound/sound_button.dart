import 'package:flutter/material.dart';
import 'package:seriousgame/d_game_scenes/game_base.dart';

import 'sound_button_controller.dart';

/// This class manage the button sound that you can see on the bundle top
class SoundOverlay extends StatelessWidget {
  final double overlaysSize;
  final DiabeteGameBase game;
  final bool flag;
  final GameSoundController gameSoundController;

  const SoundOverlay({
    super.key,
    required this.game,
    required this.overlaysSize,
    required this.flag,
    required this.gameSoundController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x8f37474f),
      child: IconButton(
        iconSize: overlaysSize,
        icon: flag
            ? const Icon(Icons.volume_up_rounded)
            : const Icon(Icons.volume_off_rounded),
        color: flag ? Colors.amber.shade300 : Colors.green.shade200,
        onPressed: () async {
          gameSoundController.setSound(!flag);
        },
      ),
    );
  }
}
