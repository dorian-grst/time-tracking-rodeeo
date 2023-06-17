import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/current_task_timer_view.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class DurationDisplayPanel extends StatelessWidget {
  const DurationDisplayPanel(
      {super.key,
      required this.name,
      required this.initialDuration,
      required this.currentStartTime});
  final DateTime? currentStartTime;
  final Duration initialDuration;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentTaskTimerView(
              key: ValueKey(initialDuration),
              formerTaskDuration: initialDuration,
              currentStartTime: currentStartTime,
            ),
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
                  name,
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
