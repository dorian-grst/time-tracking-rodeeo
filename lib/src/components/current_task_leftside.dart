import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/current_task_timer_view.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class CurrentTaskLeftside extends StatelessWidget {
  const CurrentTaskLeftside({
    super.key,
    required this.taskIndex,
  });

  final dynamic taskIndex;

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
            CurrentTaskTimerView(
              formerTaskDuration: const Duration(minutes: 18),
              currentStartTime: DateTime.now().add(const Duration(minutes: -5)),
              // currentDuration: task.currentDuration,
              // currentStartTime: task.sessionDuration,
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
