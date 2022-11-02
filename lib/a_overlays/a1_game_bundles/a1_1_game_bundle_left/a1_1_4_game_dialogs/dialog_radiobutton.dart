import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a1_game_bundles/a1_1_game_bundle_left/a1_1_4_game_dialogs/dialog_controller.dart';

/// Widget for the radio button dialog
class DialogRadioButton extends StatefulWidget {
  final GameDialogController gameDialogController;
  final List<Map<String, dynamic>> answers;

  const DialogRadioButton(
      {required this.gameDialogController, required this.answers, super.key});

  @override
  State<DialogRadioButton> createState() => _DialogRadioButton();
}

class _DialogRadioButton extends State<DialogRadioButton> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.brown;
    }

    return Column(
      children: widget.answers.asMap().entries.map((answer) {
        return Row(
          children: [
            Radio<String>(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: answer.value["answer"],
              groupValue: widget.gameDialogController.radioAnswer,
              onChanged: (String? value) {
                setState(() {
                  widget.gameDialogController.radioAnswer = value!;
                });
              },
            ),
            Text(
              answer.value["answer"],
            )
          ],
        );
      }).toList(),
    );
  }
}
