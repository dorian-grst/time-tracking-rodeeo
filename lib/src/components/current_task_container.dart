import 'package:apprentissage/src/components/current_task_rightside.dart';
import 'package:apprentissage/src/components/current_task_leftside.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:flutter/material.dart';

class CurrentTaskContainer extends StatelessWidget {
  const CurrentTaskContainer({super.key, required this.currentTaskIndex});

  final dynamic currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    final task = taskBox.get(currentTaskIndex);
    final taskTime = task.sessionDuration;
    final isPlayingNotifier = ValueNotifier<bool>(taskTime != null);
    return Row(
      children: [
        CurrentTaskLeftside(
          taskIndex: currentTaskIndex,
        ),
        const Spacer(),
        CurrentTaskRightside(
          taskIndex: currentTaskIndex,
        ),
      ],
    );
  }
}
