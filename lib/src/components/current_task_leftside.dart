import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/current_task_timer.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class CurrentTaskLeftside extends StatelessWidget {
  const CurrentTaskLeftside({
    super.key,
    required this.task,
    required this.isPlayingNotifier,
  });

  final Task? task;
  final ValueNotifier<bool> isPlayingNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
                valueListenable: isPlayingNotifier,
                builder: (context, isPlaying, child) {
                  return CurrentTaskTimer(
                    isPlaying: isPlaying,
                    durationSecond: task!.durationSecond,
                  );
                }),
            hSizedBox15,
            Row(
              children: [
                SizedBox(
                  width: 12,
                  height: 12,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colorScheme.onBackground,
                      border: Border.all(
                        color: context.colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                wSizedBox10,
                Text(
                  task!.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
