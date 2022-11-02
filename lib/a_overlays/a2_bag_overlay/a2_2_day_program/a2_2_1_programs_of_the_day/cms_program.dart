import 'package:flutter/material.dart';

import '../../../../z_globals/z3_strings_manager.dart';
import '../a2_2_2_day_program_ui_material/todo_details.dart';
import '../a2_2_2_day_program_ui_material/todo_model.dart';
import '../a2_2_2_day_program_ui_material/todo_tile.dart';

/// CMS program widget
class CMSProgram extends StatelessWidget {
  CMSProgram({super.key});

  final List<ToDoModel> toDoCMSList = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: toDoCMSList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == toDoCMSList.length + 1) {
          return Container();
        }
        return ProgramTile(
          onTap: () {
            TodoDetails.show(context: context, todo: toDoCMSList[index - 1]);
          },
          toDo: toDoCMSList[index - 1],
        );
      },
    );
  }
}
