import 'package:apprentissage/src/components/current_task_rightside.dart';
import 'package:apprentissage/src/components/current_task_leftside.dart';
import 'package:flutter/material.dart';

class CurrentTaskContainer extends StatelessWidget {
  const CurrentTaskContainer({super.key, required this.currentTaskIndex});

  final dynamic currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    final isPlayingNotifier = ValueNotifier<bool>(false);

    return Row(
      children: [
        CurrentTaskLeftside(
          taskIndex: currentTaskIndex,
          isPlayingNotifier: isPlayingNotifier,
        ),
        const Spacer(),
        CurrentTaskRightside(
          taskIndex: currentTaskIndex,
        ),
      ],
    );
  }
}
