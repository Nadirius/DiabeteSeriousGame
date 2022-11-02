import 'package:flutter/material.dart';

import '../../../../z_globals/z3_strings_manager.dart';
import '../a2_2_2_day_program_ui_material/todo_details.dart';
import '../a2_2_2_day_program_ui_material/todo_model.dart';
import '../a2_2_2_day_program_ui_material/todo_tile.dart';

/// School program widget
class SchoolProgram extends StatelessWidget {
  SchoolProgram({super.key});

  final List<ToDoModel> toDoSchoolList = [
    ToDoModel(
      todoTitle: GameSituation.situation8Title,
      todoSubtitle: GameSituation.situation8Subtitle,
      description: GameSituation.situation8Description,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: toDoSchoolList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == toDoSchoolList.length + 1) {
          return Container();
        }
        return ProgramTile(
          onTap: () {
            TodoDetails.show(context: context, todo: toDoSchoolList[index - 1]);
          },
          toDo: toDoSchoolList[index - 1],
        );
      },
    );
  }
}
