import 'package:flutter/material.dart';

import '../../../../z_globals/z3_strings_manager.dart';
import '../a2_2_2_day_program_ui_material/todo_details.dart';
import '../a2_2_2_day_program_ui_material/todo_model.dart';
import '../a2_2_2_day_program_ui_material/todo_tile.dart';

/// Program widget for the bag
class AllProgram extends StatelessWidget {
  AllProgram({super.key});

  final List<ToDoModel> toDoAllList = [
    ToDoModel(
      todoTitle: GameSituation.situation1Title,
      todoSubtitle: GameSituation.situation1Subtitle,
      description: GameSituation.situation1Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation2Title,
      todoSubtitle: GameSituation.situation2Subtitle,
      description: GameSituation.situation2Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation3Title,
      todoSubtitle: GameSituation.situation3Subtitle,
      description: GameSituation.situation3Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation4Title,
      todoSubtitle: GameSituation.situation4Subtitle,
      description: GameSituation.situation4Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation5Title,
      todoSubtitle: GameSituation.situation5Subtitle,
      description: GameSituation.situation5Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation6Title,
      todoSubtitle: GameSituation.situation6Subtitle,
      description: GameSituation.situation6Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation7Title,
      todoSubtitle: GameSituation.situation7Subtitle,
      description: GameSituation.situation7Description,
    ),
    ToDoModel(
      todoTitle: GameSituation.situation8Title,
      todoSubtitle: GameSituation.situation8Subtitle,
      description: GameSituation.situation8Description,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: toDoAllList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == toDoAllList.length + 1) {
          return Container();
        }
        return ProgramTile(
          onTap: () {
            TodoDetails.show(context: context, todo: toDoAllList[index - 1]);
          },
          toDo: toDoAllList[index - 1],
        );
      },
    );
  }
}
