import 'package:apprentissage/src/components/start_stop_button.dart';
import 'package:apprentissage/src/components/state_info_panel.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:flutter/material.dart';

class DurationStartStopPanel extends StatelessWidget {
  const DurationStartStopPanel({
    super.key,
    required this.isPlayingNotifier,
  });
  final ValueNotifier<bool> isPlayingNotifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ValueListenableBuilder(
          valueListenable: isPlayingNotifier,
          builder: (context, isPlaying, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StateInfoPanel(
                  taskState: isPlaying ? TaskState.inProgress : TaskState.pause,
                ),
                StartStopButton(
                  isPlaying: isPlaying,
                  onTap: () {
                    isPlayingNotifier.value = !isPlaying;
                  },
                )
              ],
            );
          }),
    );
  }
}
