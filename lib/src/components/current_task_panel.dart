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
    final initialIsPlaying = task.sessionDuration != Duration.zero;
    bool firstUse = true;

    bool actualPlaying(bool isPlaying) {
      if (firstUse) {
        firstUse = false;
        return initialIsPlaying;
      }
      return isPlaying;
    }

    final isPlayingNotifier = ValueNotifier<bool>(initialIsPlaying);
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: isPlayingNotifier,
            builder: (context, newIsPlaying, child) {
              final actualIsPlaying = actualPlaying(newIsPlaying);
              late final int initialStartedAt;
              late final Duration initialDuration;
              final formerTaskDuration = Duration(seconds: task.durationSecond);
              /* final isDifferent = newIsPlaying != initialIsPlaying;
              print('isDifferent: $isDifferent'); */
              if (actualIsPlaying) {
                initialStartedAt = DateTime.now().millisecondsSinceEpoch;
                initialDuration = formerTaskDuration;
              } else {
                //STOP LA TACHE
                final nowInMsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
                final startedAt = task.activityStartedAt;
                final duration = nowInMsSinceEpoch - startedAt;
                initialDuration = formerTaskDuration + Duration(seconds: duration);
                task.durationSecond = initialDuration.inSeconds;
                initialStartedAt = 0;
              }
              //}
              task.activityStartedAt = initialStartedAt;
              task.save();
              final startTime = initialStartedAt == 0
                  ? null
                  : DateTime.fromMillisecondsSinceEpoch(initialStartedAt);

              //final sessionStartTime = newIsPlaying ?
              return DurationDisplayPanel(
                name: task.name,
                initialDuration: initialDuration,
                //initialDuration: Duration(minutes: 4),
                currentStartTime: startTime,
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
