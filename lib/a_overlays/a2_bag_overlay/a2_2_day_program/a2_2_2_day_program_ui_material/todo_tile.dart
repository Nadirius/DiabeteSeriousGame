import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/a2_2_day_program/a2_2_2_day_program_ui_material/todo_model.dart';

/// Program tile widget
class ProgramTile extends StatelessWidget {
  const ProgramTile({required this.toDo, required this.onTap, super.key});

  final VoidCallback onTap;
  final ToDoModel toDo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Pixel.checkboxon),
      title: Text(toDo.todoTitle),
      subtitle: Text(toDo.todoSubtitle),
      trailing: const Icon(Pixel.arrowbarright),
      enabled: true,
      onTap: onTap,
    );
  }
}
