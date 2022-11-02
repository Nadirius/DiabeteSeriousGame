// ignore: depend_on_referenced_packages
import 'package:tiled/tiled.dart';
import 'package:flame/components.dart';

import '../../../a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_model.dart';
import '../../b1_characters/player.dart';
import '../map_object.dart';

/// TV object
class TV extends MapObject {
  bool _hasCollided = false;
  bool _streamDialofFlag = true;
  TV({
    required bool isHavaingCollisionShapePolygone,
    List<Point>? polygonePoints,
  }) : super(
          polygonePoints: polygonePoints,
          isHavaingCollisionShapePolygone: isHavaingCollisionShapePolygone,
        );

  final dialogs = <DialogModel>[
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionInput,
      question:
          "Félicitations ! Il s’agit de la bonne réponse. Parmi les symptômes évoqués par le fils du patient, trois symptômes représentent les symptômes cardinaux de l’hyperglycémie : la polyphagie, la polyurie et la polydipsie.",
      inputAnswer: "U",
      hasNext: true,
      index: 0,
    ),
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionCheckbox,
      questionTitle: "Evaluation du Sprint 0 :",
      question: "Que pensez vous de notre travail ?",
      answers: [
        {
          "result": false,
          "answer": "1. C'est vraiment pas ce que nous attendions...",
        },
        {
          "result": false,
          "answer": "2. Bof...",
        },
        {
          "result": true,
          "answer": "3. Vendu 💰!",
        },
        {
          "result": true,
          "answer": "3. Vendu 💰!",
        },
      ],
      hasNext: true,
      index: 1,
    ),
    DialogModel(
      isShowDialog: true,
      dialogMessage:
          "Félicitations ! Il s’agit de la bonne réponse. Parmi les symptômes évoqués par le fils du patient, trois symptômes représentent les symptômes cardinaux de l’hyperglycémie : la polyphagie, la polyurie et la polydipsie.",
      hasNext: true,
      index: 2,
    ),
    DialogModel(
      isShowDialog: true,
      dialogType: DialogType.questionRadioButton,
      question: "Que pensez vous de notre travail ?",
      answers: [
        {
          "result": false,
          "answer": "EVA",
        },
        {
          "result": true,
          "answer": "SBAR",
        },
        {
          "result": false,
          "answer": "ABCDE",
        },
      ],
      hasNext: true,
      index: 3,
    ),
  ];

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayerComponent) {
      if (!_hasCollided) {
        if (_streamDialofFlag) {
          gameRef.gameScenesController.gameDialogController
              .onDialogList(dialogs);
        }
        _streamDialofFlag = false;
        _hasCollided = true;
      }
    }
  }

  /// Reset values when player ends the collision
  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is PlayerComponent) {
      _hasCollided = false;
      _streamDialofFlag = true;
    }
    super.onCollisionEnd(other);
  }
}
