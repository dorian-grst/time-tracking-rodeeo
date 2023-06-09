import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/current_task_timer.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class CurrentTaskLeftside extends StatelessWidget {
  const CurrentTaskLeftside({
    super.key,
    required this.taskIndex,
    required this.isPlayingNotifier,
  });

  final dynamic taskIndex;
  final ValueNotifier<bool> isPlayingNotifier;

  @override
  Widget build(BuildContext context) {
    if (taskIndex == null) return const SizedBox();
    if (taskBox.containsKey(taskIndex) == false) return const SizedBox();
    final task = taskBox.get(taskIndex);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentTaskTimer(
              timableObject: task,
            ),
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
                  taskBox.get(taskIndex)?.name,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
