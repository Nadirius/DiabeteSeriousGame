import 'package:flame/components.dart';

import '../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../d_game_scenes/d_1_village_cms/game_scene_brocoli.dart';
import '../../z_globals/z4_assets_manager.dart';
import 'perso_base.dart';
import 'player.dart';

/// This class manager Brocoli Son. Brocoli Son inherits from perso (perso_base.dart)
class BrocoliSon extends Perso with HasGameRef<DiabeteGameSceneBorocoli> {
  BrocoliSon(String user) : super(fileNamePngCharacter: GameImageAssets.user);

  
  bool _hasCollided = false;
  late double mapWidth;
  late double mapHeight;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (gameRef.etape1) {
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
              isShowDialog: true,
              dialogMessage: "Bonjour je suis le fils",
            ),
          );
        } else if (gameRef.etape2) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogsMission3Part2);

          gameRef.etape2IsDone = true;
        } else if (gameRef.etape3) {
          gameRef.gameScenesController.gameDialogController.onDialog(
            DialogModel(
              isShowDialog: true,
              dialogMessage: "Aidez mon père svp !",
            ),
          );
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

  final dialogsMission3Part2 = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Fils: \n\n"
          "Bonjour, je suis le fils de Monsieur Brocoli.\n\n"
          "Je suis inquiet pour mon papa, je ne l’ai jamais vu dans cet état. \n\n"
          "Cela fait plusieurs jours qu’il est confus. \n\n"
          "Hier matin, il ne savait plus où il se trouvait. Il se plaint parfois de douleurs au ventre. "
          "Il tousse également depuis quelques jours et se fatigue très vite lors des efforts. \n\n"
          "Cependant, je suis ravi de constater que depuis une semaine il a un meilleur appétit et qu’il s’hydrate davantage. \n\n"
          "Par contre, je suis inquiet, car il se rend très souvent aux toilettes, comme il est très affaibli je crains qu’il tombe.\n\n"
          "De plus, depuis environ deux semaines, je constate que certains médicaments que vous mettez dans le semainier se retrouvent dans la poubelle de la cuisine \n",
      hasNext: true,
      index: 0,
    ),
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionCheckbox,
      question:
          "D’après le récit du fils du patient, quels sont les signes ou symptômes qui vous indiquent une probable décompensation du diabète de Monsieur Brocoli ? \n",
      hasNext: true,
      answers: [
        {
          "result": true,
          "answer": "Alimentation excessive",
        },
        {
          "result": false,
          "answer": "Toux",
        },
        {
          "result": true,
          "answer": "Hydratation excessive",
        },
        {
          "result": false,
          "answer": "Dyspnée à l’effort",
        },
        {
          "result": true,
          "answer": "Urines fréquentes",
        }
      ],
      index: 1,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "Félicitations ! Il s’agit de la bonne réponse. \n\n"
          "Parmi les symptômes évoqués par le fils du patient, trois symptômes représentent les symptômes cardinaux de l’hyperglycémie : la polyphagie, la polyurie et la polydipsie.\n",
      hasNext: true,
      index: 2,
    ),
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionBinary,
      question:
          "Dans cette situation, est-il nécessaire de poursuivre l’examen clinique ?\n",
      hasNext: true,
      answers: [
        {
          "result": true,
          "answer": "Oui",
        },
        {
          "result": false,
          "answer": "Non",
        }
      ],
      index: 3,
    ),
    //if false
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "D’après le récit du fils du patient, vous suspectez un état hyperglycémique pouvant entraîner des répercussions graves sur l’état de santé du patient.\n"
          "Vous devez poursuivre l’examen clinique afin de mesurer le degré d’urgence de la situation. \n\n",
      hasNext: true,
      index: 4,
    ),

    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "« L’examen clinique révèle que le patient somnole mais qu’il "
          "est réveillable lors de la stimulation verbale. Il n’est orienté ni dans le temps "
          "ni dans l’espace. Cependant, il sait que vous êtes infirmière au CMS et que son fils est "
          "présent dans la salle. Ses paramètres vitaux sont les suivants :"
          " TA = 100/60 mmHg, FC= 98 bpm, FR = 22/min, sat = 90%, température = 37.5oC. La glycémie est à 40 mmol/L \n\n",
      hasNext: true,
      index: 5,
    ),
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionCheckbox,
      question:
          "Au vu des résultats de l’examen clinique, que faites-vous ?  \n",
      hasNext: true,
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
          "answer": "Ce n’est pas urgent, aucune intervention nécessaire",
        },
      ],
      index: 6,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage: "C’est la bonne réponse ! Il s’agit d’une urgence,"
          " le patient risque un coma hyperosmolaire. Vous ne pouvez effectivement"
          " pas injecter les 10 UI d’insuline car vous n’avez pas de prescription médicale.  \n\n",
      hasNext: true,
      index: 7,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Devant le tableau clinique, le médecin traitant vous demande d’appeler les urgences afin d’hospitaliser le patient. \n\n",
      hasNext: true,
      index: 8,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Ouvrez votre sac à dos et rendez-vous dans l’onglet présentant les professionnels de la santé et sélectionnez l’icône correspondant aux urgences. \n\n",
      hasInteraction: true,
      interaction: ["contacts", "Urgences médicales", true],
      hasNext: false,
      index: 9,
    ),
  ];
}
