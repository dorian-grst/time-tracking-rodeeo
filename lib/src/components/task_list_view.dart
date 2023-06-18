import 'package:apprentissage/src/components/list_view_cell.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({
    Key? key,
    required this.currentTaskIndexObserver,
  }) : super(key: key);

  final ValueNotifier<dynamic> currentTaskIndexObserver;

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  void onDeleteTask(Task task) {
    setState(() {
      taskBox.delete(task.key);
      // ignore: avoid_print
      print(taskBox);
      Navigator.pop(context);
    });
  }

  void onTaskEdited(Task task, Task newTask) {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final reversedTaskList = taskBox.values.toList().reversed.toList();
    final currentTaskIndex = widget.currentTaskIndexObserver.value;
    final currentTask =
        currentTaskIndex != null ? taskBox.get(currentTaskIndex) : null;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: taskBox.length,
      itemBuilder: (context, index) {
        Task task = reversedTaskList[index];
        return ListViewCell(
          task: task,
          onDeleteTask: () {
            if (task == currentTask) {
              widget.currentTaskIndexObserver.value = null;
            }
            onDeleteTask(task);
          },
          onEditTask: (newTask) => onTaskEdited(task, newTask),
          onSelectTask: () {
            widget.currentTaskIndexObserver.value = task.key;
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
