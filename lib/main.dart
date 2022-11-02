import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/a2_4_professional_contacts/contact_controller.dart';
import 'package:seriousgame/z_globals/z8_font_manager.dart';

import 'a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_1_sound/sound_button_controller.dart';
import 'a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_3_configuration/config_button_controller.dart';
import 'a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_controller.dart';
import 'a_overlays/a1_game_bundles/game_bundles_manager.dart';
import 'a_overlays/a2_bag_overlay/player_bag_manager.dart';
import 'a_overlays/a3_params/params_overlay.dart';
import 'd_game_scenes/game_base.dart';
import 'e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'e_game_controllers/e_2_score_controller/player_score_controller.dart';
import 'e_game_controllers/e_3_bag_controller/player_bag_controller.dart';
import 'z_globals/z1_game_manager.dart';
import 'z_globals/z2_routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GameScenesController gameController = GameScenesController();
  final GameSoundController gameSoundController = GameSoundController();
  final PlayerBagController bagController = PlayerBagController();
  final PlayerScoreController scoreController = PlayerScoreController();
  final GameDialogController gameDialogController = GameDialogController();
  final ConfigButtonController configButtonController =
      ConfigButtonController();
  final ContactsController contactsController = ContactsController();

  gameController.gameSoundController = gameSoundController;
  gameController.bagController = bagController;
  gameController.scoreController = scoreController;
  gameController.gameDialogController = gameDialogController;
  gameController.configButtonController = configButtonController;
  gameController.contactsController = contactsController;
  gameDialogController.gameSceneController = gameController;

  gameController.start();
  bagController.start();
  scoreController.start();
  gameDialogController.start();
  gameSoundController.start();
  configButtonController.start();
  contactsController.start();

  runApp(
    Resize(
      size: const Size(1408, 800),
      builder: () {
        return MaterialApp(
          builder: (context, child) => ResponsiveWrapper.builder(child,
              minWidth: 1000,
              defaultScale: true,
              background: Container(color: Colors.black)),
          debugShowCheckedModeBanner: false,
          title: 'Serious Game Diabète',
          theme: ThemeData(
            primarySwatch: Colors.brown,
            fontFamily: FontFamily.pixelSansSerif,
          ),
          home: Scaffold(
            body: Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 800,
                  maxWidth: 1408,
                  minWidth: 1000,
                  minHeight: 569,
                ),
                child: StreamBuilder<DiabeteGameBase>(
                  stream: gameController.currentScene,
                  initialData: gameController.scene,
                  builder: (
                    context,
                    scene,
                  ) {
                    return GameWidget<DiabeteGameBase>(
                      game: scene.data!,
                      overlayBuilderMap: {
                        GameOverlaysRoutes.gameBundleManager: (
                          BuildContext context,
                          DiabeteGameBase game,
                        ) {
                          return GameBundlesManager(
                            game: game,
                            overlaysSize: 32,
                            playerBagController: bagController,
                            playerScoreController: scoreController,
                            gameDialogController: gameDialogController,
                            gameSoundController: gameSoundController,
                            configButtonController: configButtonController,
                          );
                        },
                        GameOverlaysRoutes.playerBag: (
                          BuildContext context,
                          DiabeteGameBase game,
                        ) =>
                            StreamBuilder<bool>(
                              stream: bagController.outputBag,
                              initialData: bagController.bagState,
                              builder: (
                                context,
                                openBag,
                              ) {
                                return Visibility(
                                  visible:
                                      openBag.hasError ? false : openBag.data!,
                                  child: PlayerBag(
                                    game: game,
                                    playerBagController: bagController,
                                    contactsController: contactsController,
                                  ),
                                );
                              },
                            ),
                        GameOverlaysRoutes.settings: (
                          BuildContext context,
                          DiabeteGameBase game,
                        ) =>
                            StreamBuilder<bool>(
                              stream: configButtonController.outputScore,
                              initialData: configButtonController.openConfig,
                              builder: (
                                context,
                                openConfig,
                              ) {
                                return Visibility(
                                  visible: openConfig.hasError
                                      ? false
                                      : openConfig.data!,
                                  child: ParamsOverlay(
                                    gameScenesController: gameController,
                                  ),
                                );
                              },
                            ),
                        //#########################################################################################33

//###########################################################################################3
                      },
                      initialActiveOverlays:
                          scene.data!.sceneName == GameScenes.startPage
                              ? [
                                  GameOverlaysRoutes.settings,
                                ]
                              : const [
                                  GameOverlaysRoutes.gameBundleManager,
                                  GameOverlaysRoutes.playerBag,
                                  GameOverlaysRoutes.settings,
                                ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
