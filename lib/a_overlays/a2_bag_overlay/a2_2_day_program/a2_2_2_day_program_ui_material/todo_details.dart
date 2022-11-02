import 'package:flutter/material.dart';
import 'package:seriousgame/a_overlays/a2_bag_overlay/a2_2_day_program/a2_2_2_day_program_ui_material/todo_model.dart';

/// To do details widget
class TodoDetails extends StatelessWidget {
  const TodoDetails({required this.todo, super.key});

  final ToDoModel todo;

  static Future<void> show(
      {required BuildContext context, required ToDoModel todo}) async {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => TodoDetails(
          todo: todo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(todo.todoTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    "${todo.todoSubtitle} :",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    width: 600,
                    child: SingleChildScrollView(
                      child: Text(
                        todo.description,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
