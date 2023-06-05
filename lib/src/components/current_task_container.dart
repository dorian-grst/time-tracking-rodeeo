import 'package:apprentissage/src/components/current_task_rightside.dart';
import 'package:apprentissage/src/components/current_task_leftside.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:flutter/material.dart';

class CurrentTaskContainer extends StatelessWidget {
  const CurrentTaskContainer({super.key, required this.actualTask});

  final Task actualTask;

  @override
  Widget build(BuildContext context) {
    final taskStateNotifier = ValueNotifier<TaskState>(actualTask.state);
    final isPlayingNotifier = ValueNotifier<bool>(false);

    return Row(
      children: [
        CurrentTaskLeftside(
          task: actualTask,
          isPlayingNotifier: isPlayingNotifier,
        ),
        const Spacer(),
        CurrentTaskRightside(
          taskStateNotifier: taskStateNotifier,
          isPlayingNotifier: isPlayingNotifier,
        ),
      ],
    );
  }
}
