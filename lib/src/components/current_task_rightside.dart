import 'package:apprentissage/src/components/current_task_button.dart';
import 'package:apprentissage/src/components/state_info_panel.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:flutter/material.dart';

class CurrentTaskRightside extends StatelessWidget {
  const CurrentTaskRightside({
    super.key,
    required this.taskIndex,
  });
  final dynamic taskIndex;

  @override
  Widget build(BuildContext context) {
    final task = taskBox.get(taskIndex);
    void togglePlaying() {}

    if (task == null) return const SizedBox();
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          StateInfoPanel(
            taskState: task.state,
          ),
          CurrentTaskButton(
            isPlaying: task.isPlaying,
            onTap: togglePlaying,
          )
        ],
      ),
    );
  }
}
