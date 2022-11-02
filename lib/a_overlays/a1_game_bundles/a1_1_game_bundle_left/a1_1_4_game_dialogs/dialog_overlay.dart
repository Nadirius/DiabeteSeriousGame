import 'package:animated_text_kit/animated_text_kit.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import './dialog_controller.dart';
import '../../../../../z_globals/z8_font_manager.dart';
import '../../../../d_game_scenes/game_base.dart';
import '../../../../e_game_controllers/e_2_score_controller/player_score_controller.dart';
import '../../../../y_common_widgets/show_alert_dialog.dart';
import 'dialog_binary_radiobutton.dart';
import 'dialog_checkbox.dart';
import 'dialog_model.dart';
import 'dialog_radiobutton.dart';
import 'dialog_text_field.dart';

/// Widget to display the dialog as an overlay
class DialogOverlay extends StatelessWidget {
  final DiabeteGameBase game;
  final GameDialogController gameDialogController;
  final PlayerScoreController playerScoreController;

  final DialogModel dialog;

  const DialogOverlay({
    Key? key,
    required this.playerScoreController,
    required this.game,
    required this.dialog,
    required this.gameDialogController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.player.canMove = false;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: const Color.fromARGB(181, 201, 210, 182),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...(dialog.dialogType == DialogType.display
                ? _displayDialog(dialog, context)
                : _displayQuestion(dialog, context)),
          ],
        ),
      ),
    );
  }

  /// Display the dialog as a question
  _displayQuestion(DialogModel dialog, BuildContext context) {
    if (dialog.hasInteraction!) {
      _resolveInteraction();
    }
    switch (dialog.dialogType) {
      case DialogType.questionCheckbox:
        return [
          ..._getCheckBoxQuestion(),
          const SizedBox(height: 20),
          _getCheckBoxAnswerSubmissionRegime(context)
        ];
      case DialogType.questionRadioButton:
        return [
          ..._getRadioButtonQuestion(),
          const SizedBox(height: 20),
          _getRadioAnswerSubmissionRegime(context)
        ];
      case DialogType.questionBinary:
        return [
          ..._getBinaryRadioButtonQuestion(),
          const SizedBox(height: 20),
          _getBinaryRadioAnswerSubmissionRegime(context)
        ];
      case DialogType.questionInput:
        return [
          ..._getInputQuestion(),
          const SizedBox(height: 20),
          _getInputSubmissionRegime(context)
        ];
      default:
    }
  }

  /// Display the question with an input to answer
  _getInputQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 20),
      DialogInputQuestion(
        gameDialogController: gameDialogController,
      ),
    ];
  }

  /// Display the result of the input submission
  _getInputSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            String? answer = gameDialogController.inputAnswer;
            if (answer != null) {
              if (answer == dialog.inputAnswer) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content:
                        "Bonne réponse. Vous gagnez 1 point sur la barre de qualité des soins.",
                    defaultActionText: 'OK',
                    title: 'Bonne réponse',
                  );
                }
                gameDialogController.inputAnswer = null;
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                showAlertDialog(
                  context,
                  content: scoreFlag
                      ? "La réponse est incorrecte, retentez ! Vous perdez 1 point sur la barre des qualité des soins."
                      : "Ce n'est pas la bonne réponse, retentez !",
                  defaultActionText: 'OK',
                  title: 'Mauvaise réponse',
                );
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content: "Veuillez s'il vous plait saisir une répons !",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "Soumettre votre réponse",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// Display the question with radio buttons as answers
  _getRadioButtonQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 20),
      DialogRadioButton(
        gameDialogController: gameDialogController,
        answers: dialog.answers!,
      ),
    ];
  }

  /// Display the question with binary radio buttons as answers
  _getBinaryRadioButtonQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 20),
      DialogBinaryRadioButton(
        gameDialogController: gameDialogController,
        answers: dialog.answers!,
      ),
    ];
  }

  /// Display the result of the radio button submission
  _getRadioAnswerSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            String? answer = gameDialogController.radioAnswer;
            if (answer != null) {
              if (_isResultTrue(answer)) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content:
                        "Bonne réponse. Vous gagnez 1 point sur la barre de qualité des soins.",
                    defaultActionText: 'OK',
                    title: 'Bonne réponse',
                  );
                }
                gameDialogController.radioAnswer = null;
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                showAlertDialog(
                  context,
                  content: scoreFlag
                      ? "La réponse est incorrecte, retentez ! Vous perdez 1 point sur la barre des qualité des soins."
                      : "Ce n'est pas la bonne réponse, retentez !",
                  defaultActionText: 'OK',
                  title: 'Mauvaise réponse',
                );
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content: "Veuillez s'il vous plait cocher une réponse !",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "soumettre votre réponse",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// Display the result of the binary radio button submission
  _getBinaryRadioAnswerSubmissionRegime(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            bool? result = gameDialogController.binaryAnswer;
            if (result != null) {
              if (result) {
                playerScoreController.updateScore(true);
                showAlertDialog(
                  context,
                  content:
                      "Bonne réponse. Vous gagnez 1 point sur la barre de qualité des soins.",
                  defaultActionText: 'OK',
                  title: 'Bonne réponse',
                );
              } else {
                playerScoreController.updateScore(false);
                showAlertDialog(
                  context,
                  content:
                      "La réponse est incorrecte, vous ne pouvez pas retenter ! Vous perdez 1 point sur la barre des qualité des soins.",
                  defaultActionText: 'OK',
                  title: 'Mauvaise réponse',
                );
              }
              gameDialogController.binaryAnswer = null;
              nextAction(dialog.hasNext);
            } else {
              showAlertDialog(
                context,
                content: "Veuillez s'il vous plait cocher une réponse !",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "soumettre votre réponse",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// Display the result of the checkbox submission
  Row _getCheckBoxAnswerSubmissionRegime(BuildContext context) {
    bool scoreFlag = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            if (gameDialogController.answersTracker.contains(true)) {
              bool result = const ListEquality().equals(
                  dialog.questioAnswer, gameDialogController.answersTracker);
              if (result) {
                if (scoreFlag) {
                  playerScoreController.updateScore(true);
                  showAlertDialog(
                    context,
                    content:
                        "Bonne réponse. Vous gagnez 1 point sur la barre de qualité des soins.",
                    defaultActionText: 'OK',
                    title: 'Bonne réponse',
                  );
                }
                gameDialogController.answersTracker = [];
                nextAction(dialog.hasNext);
              } else {
                if (scoreFlag) playerScoreController.updateScore(false);
                showAlertDialog(
                  context,
                  content: scoreFlag
                      ? "La réponse est incorrecte, retentez ! Vous perdez 1 point sur la barre des qualité des soins."
                      : "Ce n'est pas la bonne réponse, retentez !",
                  defaultActionText: 'OK',
                  title: 'Mauvaise réponse',
                );
              }
              scoreFlag = false;
            } else {
              showAlertDialog(
                context,
                content:
                    "Veuillez s'il vous plait cocher une ou plusieurs réponses",
                defaultActionText: 'OK',
                title: 'Soumission de réponse incorrecte',
              );
            }
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: const Text(
            "soumettre votre réponse",
            style: TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// Display the question with checkbox buttons as answers
  _getCheckBoxQuestion() {
    return [
      Text(
        dialog.question!,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 20),
      ..._getCheckBoxAnswersElement(),
    ];
  }

  /// Display the dialog as a simple dialog
  _displayDialog(
    DialogModel? dialog,
    BuildContext context,
  ) {
    if (dialog!.hasInteraction!) {
      _resolveInteraction();
    }
    return [
      _getAnimatedText(dialog.dialogMessage!,
          callback: () =>
              gameDialogController.inputHasNextDialog.add(dialog.hasNext)),
      StreamBuilder<bool>(
        stream: gameDialogController.outputHasNextDialog,
        builder: (context, hasNext) {
          return hasNext.hasData
              ? _displayDialogButton(
                  hasNext.data!,
                )
              : Container();
        },
      ),
    ];
  }

  /// Display the animated text
  _getAnimatedText(String text,
      {VoidCallback? callback, double? fontsize = FontSizeManager.s12}) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: TextStyle(
            fontSize: fontsize,
            fontFamily: FontFamily.pixelSansSerif,
          ),
          speed: const Duration(
            milliseconds: 1,
          ),
        ),
      ],
      isRepeatingAnimation: false,
      onFinished: () => dialog.isTransition! ? null : callback!(),
    );
  }

  /// Display the dialog button
  _displayDialogButton(bool hasNext) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            nextAction(hasNext);
          },
          icon: const Icon(
            Icons.arrow_right,
            size: 32,
          ),
          label: Text(
            hasNext ? "suite " : "fermer",
            style: const TextStyle(
              fontFamily: FontFamily.pixelSansSerif,
            ),
          ),
        ),
      ],
    );
  }

  /// Call the next action
  void nextAction(bool hasNext) {
    disableDialog(hasNext);
    Future.delayed(
      const Duration(milliseconds: 10),
      () => {
        if (hasNext) gameDialogController.onNextDialog(),
      },
    );
  }

  /// Disable the dialog
  disableDialog(bool hasNext) {
    gameDialogController.onDialog(
      DialogModel(isShowDialog: false),
    );
    game.player.canMove = hasNext ? false : true;
  }

  /// Display the checkbox answers
  _getCheckBoxAnswersElement() {
    return dialog.answers?.asMap().entries.map((answer) {
      gameDialogController.answersTracker.add(false);
      return Row(
        children: [
          DialogCheckbox(
            gameDialogController: gameDialogController,
            questionIndex: answer.key,
          ),
          Text(
            answer.value["answer"],
          )
        ],
      );
    }).toList();
  }

  /// Validate if the answer is correct
  bool _isResultTrue(String answer) {
    return ((dialog.answers!
        .where((element) => element.containsValue(answer))
        .first["result"]));
  }

  void _resolveInteraction() {
    gameDialogController
        .dialogsInteractions[dialog.interaction![0]]![dialog.interaction![1]]
        .isReachable = dialog.interaction![2];
  }
}
