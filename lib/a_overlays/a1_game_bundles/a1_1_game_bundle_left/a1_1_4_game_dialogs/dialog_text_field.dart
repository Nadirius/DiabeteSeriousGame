import 'package:flutter/material.dart';

import 'dialog_controller.dart';

/// Widget for the input dialog
class DialogInputQuestion extends StatefulWidget {
  final GameDialogController gameDialogController;

  const DialogInputQuestion({required this.gameDialogController, super.key});

  @override
  State<DialogInputQuestion> createState() => _DialogInputQuestionState();
}

class _DialogInputQuestionState extends State<DialogInputQuestion> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.gameDialogController.inputAnswer = value;
      },
      decoration: const InputDecoration(
        hintText: "Votre réponse :",
        labelText: "Saisissez votre réponse :",
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
    );
  }
}
