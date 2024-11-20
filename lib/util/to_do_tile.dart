import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoListItem extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?) onChanged;
  DismissDirectionCallback deleteTask;
  ToDoListItem({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(taskName),
      onDismissed: deleteTask,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.yellow,
                checkColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 22,
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
