import 'package:flutter/material.dart';

import '../../../../z_globals/z3_strings_manager.dart';
import '../a2_2_2_day_program_ui_material/todo_details.dart';
import '../a2_2_2_day_program_ui_material/todo_model.dart';
import '../a2_2_2_day_program_ui_material/todo_tile.dart';

/// Hospital program widget
class HospitalProgram extends StatelessWidget {
  HospitalProgram({super.key});

  final List<ToDoModel> toDoHospitalList = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: toDoHospitalList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == toDoHospitalList.length + 1) {
          return Container();
        }
        return ProgramTile(
          onTap: () {
            TodoDetails.show(
                context: context, todo: toDoHospitalList[index - 1]);
          },
          toDo: toDoHospitalList[index - 1],
        );
      },
    );
  }
}
