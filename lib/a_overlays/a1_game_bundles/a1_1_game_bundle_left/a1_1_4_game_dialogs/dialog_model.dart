/// Types of dialog
enum DialogType {
  display,
  questionCheckbox,
  questionRadioButton,
  questionBinary,
  questionInput
}

/// Dialog model
class DialogModel {
  bool isShowDialog;
  DialogType? dialogType;
  String? dialogMessage;
  bool hasNext;
  bool? isTransition;
  String? questionTitle;
  String? question;
  String? inputAnswer;
  bool? hasInteraction;
  List<dynamic>? interaction;
  List<Map<String, dynamic>>? answers;
  int? index;
  DialogModel({
    this.isShowDialog = false,
    this.isTransition = false,
    this.dialogType = DialogType.display,
    this.dialogMessage,
    this.hasNext = false,
    this.hasInteraction = false,
    this.interaction,
    this.inputAnswer,
    this.questionTitle,
    this.question,
    this.answers,
    this.index,
  });

  List<dynamic> get questioAnswer =>
      answers!.map((answer) => answer["result"]).toList();
}
