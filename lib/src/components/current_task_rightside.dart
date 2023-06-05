import 'package:apprentissage/src/components/current_task_button.dart';
import 'package:apprentissage/src/components/state_info_panel.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:flutter/material.dart';

class CurrentTaskRightside extends StatelessWidget {
  const CurrentTaskRightside({
    super.key,
    required this.taskStateNotifier,
    required this.isPlayingNotifier,
  });
  final ValueNotifier<TaskState> taskStateNotifier;
  final ValueNotifier<bool> isPlayingNotifier;

  @override
  Widget build(BuildContext context) {

    void togglePlaying() {
      isPlayingNotifier.value = !isPlayingNotifier.value;
    }

    return SizedBox(
      child: ValueListenableBuilder(
          valueListenable: taskStateNotifier,
          builder: (context, taskState, child) {
            return ValueListenableBuilder(
              valueListenable: isPlayingNotifier,
              builder: (context, isPlaying, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    StateInfoPanel(
                      taskState: taskState,
                    ),
                    CurrentTaskButton(
                      isPlaying: isPlaying,
                      onTap: togglePlaying,
                    )
                  ],
                );
              }
            );
          }),
    );
  }
}
