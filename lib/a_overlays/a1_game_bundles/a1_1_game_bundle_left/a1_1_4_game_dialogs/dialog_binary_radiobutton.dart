import 'package:flutter/material.dart';

import 'dialog_controller.dart';

/// Widget for the binary radio button dialog
class DialogBinaryRadioButton extends StatefulWidget {
  final GameDialogController gameDialogController;
  final List<Map<String, dynamic>> answers;

  const DialogBinaryRadioButton(
      {required this.gameDialogController, required this.answers, super.key});

  @override
  State<DialogBinaryRadioButton> createState() =>
      _DialogBinaryRadioButtonState();
}

class _DialogBinaryRadioButtonState extends State<DialogBinaryRadioButton> {
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
            Radio<bool>(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: answer.value["result"],
              groupValue: widget.gameDialogController.binaryAnswer,
              onChanged: (bool? value) {
                setState(() {
                  widget.gameDialogController.binaryAnswer = value!;
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
