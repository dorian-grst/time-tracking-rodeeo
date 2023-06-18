import 'package:apprentissage/src/components/list_view_cell_card.dart';
import 'package:apprentissage/src/components/list_view_cell_detail.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

const wSizedBox5 = SizedBox(width: 5);
const hSizedBox10 = SizedBox(height: 10);
const wSizedBox10 = SizedBox(width: 10);
const hSizedBox15 = SizedBox(height: 15);
const wSizedBox15 = SizedBox(width: 15);
const hSizedBox20 = SizedBox(height: 20);
const hSizedBox30 = SizedBox(height: 30);
const hSizedBox35 = SizedBox(height: 35);

enum TaskAction {
  select,
  edit,
  delete,
}

class ListViewCell extends StatelessWidget {
  const ListViewCell({
    super.key,
    required this.task,
    required this.onDeleteTask,
    required this.onEditTask,
    required this.onSelectTask,
  });
  final Task task;
  final VoidCallback onDeleteTask;
  final void Function(Task) onEditTask;
  final VoidCallback onSelectTask;

  Future<TaskAction?> showModalDetailTask(BuildContext context) {
    return showModalBottomSheet<TaskAction>(
      backgroundColor: context.colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ListViewCellDetail(
          task: task,
          deleteTask: () => onDeleteTask(),
          editTask: () => onEditTask(task),
          selectTask: () => onSelectTask(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showModalDetailTask(context);
      },
      child: ListViewCellCard(task: task),
    );
  }
}
