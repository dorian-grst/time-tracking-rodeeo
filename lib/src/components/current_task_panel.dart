import 'package:apprentissage/src/components/duration_display_panel.dart';
import 'package:apprentissage/src/components/duration_start_stop_panel.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

class CurrentTaskPanel extends StatelessWidget {
  const CurrentTaskPanel({
    super.key,
    required this.currentTaskIndex,
  });
  final dynamic currentTaskIndex;

  Task get task => taskBox.get(currentTaskIndex);

  @override
  Widget build(BuildContext context) {
    final initialIsPlaying = task.isStarted;

    final isPlayingNotifier = ValueNotifier<bool>(initialIsPlaying);
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: isPlayingNotifier,
            builder: (context, startTask, child) {
              if (startTask) {
                task.startSession();
              } else {
                task.stopSession();
              }
              task.save();
              return DurationDisplayPanel(
                name: task.name,
                initialDuration: task.storedDuration,
                currentStartTime: task.sessionStartDate,
              );
            }),
        const Spacer(),
        DurationStartStopPanel(
          isPlayingNotifier: isPlayingNotifier,
        ),
      ],
    );
  }
}
