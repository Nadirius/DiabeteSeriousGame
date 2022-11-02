import 'dart:async';

import '../../../../e_game_controllers/base_controller.dart';
import '../../../../e_game_controllers/e_1_scenes_controller/game_scenes_controller.dart';
import 'dialog_model.dart';

/// Dialog controller
class GameDialogController extends BaseController {
  DialogModel? _dialogModel;
  List<DialogModel>? _dialogList;

  late GameScenesController gameSceneController;

  late Map<String, dynamic> dialogsInteractions = {};

  late StreamController<DialogModel> _streamDialogController;
  late StreamController<bool> _streamHasNextDialogController;
  late StreamController<bool> _streamHasQuestionController;

  Sink<DialogModel> get inputDialog => _streamDialogController.sink;

  Sink<bool> get inputHasNextDialog => _streamHasNextDialogController.sink;

  Sink<bool> get inputHasQuestion => _streamHasQuestionController.sink;

  Stream<DialogModel> get outputDialog => _streamDialogController.stream;

  Stream<bool> get outputHasNextDialog => _streamHasNextDialogController.stream;

  Stream<bool> get outputHasQuestion => _streamHasQuestionController.stream;

  List<bool> answersTracker = [];
  bool? binaryAnswer;
  String? radioAnswer;
  String? inputAnswer;

  @override
  void start() {
    _streamDialogController = StreamController<DialogModel>.broadcast();
    _streamHasNextDialogController = StreamController<bool>.broadcast();
    _streamHasQuestionController = StreamController<bool>.broadcast();

    dialogsInteractions["contacts"] =
        gameSceneController.contactsController.contactMap;
  }

  @override
  void dispose() {
    _streamDialogController.close();
    _streamHasNextDialogController.close();
    _streamHasQuestionController.close();
  }

  /// Add a unique dialog
  onDialog(DialogModel dialogModel) async {
    inputDialog.add(dialogModel);
  }

  /// Add a list of dialogs
  onDialogList(List<DialogModel> dialogList) {
    _dialogList = dialogList;
    _dialogModel = _dialogList![0];
    if (_dialogList!.isNotEmpty) onDialog(_dialogList![0]);
  }

  /// Display the next dialog
  onNextDialog() {
    if (_dialogList!.isNotEmpty) {
      if (_dialogModel!.index! + 1 < _dialogList!.length) {
        _dialogModel = _dialogList![(_dialogModel!.index!) + 1];
        onDialog(_dialogModel!);
      }
    }
  }

  /// Send the initial dialog
  void sendInitialMessage(initialMessage) {
    onDialog(
      DialogModel(
        isShowDialog: true,
        dialogMessage: initialMessage,
      ),
    );
  }
}
