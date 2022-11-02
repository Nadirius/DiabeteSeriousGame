import 'package:flame/components.dart';

import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_brocoli.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager M. Brocoli. Brocoli inherits from perso (perso_base.dart)
class Brocoli extends Perso with HasGameRef<DiabeteGameSceneBorocoli> {
  Brocoli(String user) : super(fileNamePngCharacter: GameImageAssets.user);

  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.etape1) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part1);
          gameRef.etape1IsDone = true;
        } else if (gameRef.etape2) {
          gameRef.gameScenesController.gameDialogController.onDialog(
              DialogModel(
                  isShowDialog: true, dialogMessage: "Je suis en colère"));
        } else if (gameRef.etape3) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part3);
          gameRef.etape3IsDone = true;
        }
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
    }
    super.onCollisionEnd(other);
  }

  final dialogsMission3Part1 = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Infirmière: \n\n"
          "Bonjour, c’est Margot, l’infirmière du CMS, comment allez-vous ?\n",
      hasNext: true,
      index: 0,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Patient: \n\n"
          "Sortez de chez moi, étrangère !\n",
      hasNext: true,
      index: 1,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Vous constatez que le patient est confus et agressif. Il ne souhaite pas communiquer avec vous ce matin. \n"
          "Peut-être que son fils pourrait vous aider... \n",
      hasNext: false,
      index: 2,
    )
  ];

//#####################################
// AFFICHAGE DE LA BULLE SUR LE FILS
//#####################################

//
  final dialogsMission3Part3 = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "L’examen clinique révèle que le patient somnole mais qu’il est réveillable lors de la stimulation verbale.\n"
          "Il n’est orienté ni dans le temps ni dans l’espace. \n"
          "Cependant, il sait que vous êtes infirmière au CMS et que son fils est présent dans la salle. \n\n"
          "Ses paramètres vitaux sont les suivants :\n"
          "TA = 100/60 mmHg, FC= 98 bpm, FR = 22/min, sat = 90%, température = 37.5oC. La glycémie est à 40 mmol/L. \n",
      hasNext: true,
      questionTitle: "Question 3, mission 3:",
      question: "Au vu des résultats de l’examen clinique, que faites-vous ? ",
      answers: [
        {
          "result": true,
          "answer": "Appel au médecin traitant",
        },
        {
          "result": false,
          "answer": "Ouverture du sac à dos et injection de 10 UI d’insuline",
        },
        {
          "result": false,
          "answer": "Ce n’est pas urgent, aucune intervention nécessaire ",
        }
      ],
      index: 0,
    ),
    // if false
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Ce n’est pas la bonne réponse.\n"
          " Vous perdez 1 point sur la barre de qualité des soins. Retentez ! \n",
      hasNext: true,
      index: 1,
    ),
    // if true
    DialogModel(
      isShowDialog: true,
      dialogMessage: "C’est la bonne réponse ! \n"
          "Il s’agit d’une urgence, le patient risque un coma hyperosmolaire. \n"
          "Vous ne pouvez effectivement pas injecter les 10 UI d’insuline car vous n’avez pas de prescription médicale. \n"
          "Vous gagnez 1 point sur la barre de qualité des soins.\n",
      hasNext: true,
      index: 2,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Ouvrez votre sac à dos et rendez-vous dans l’onglet présentant les professionnels de la santé et sélectionnez l’icône correspondant aux urgences. \n",
      hasNext: false,
      index: 3,
    )
  ];
}
