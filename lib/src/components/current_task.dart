import 'package:apprentissage/src/components/current_task_container.dart';
import 'package:apprentissage/src/components/current_task_timer.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/task.dart';

import 'package:flutter/material.dart';

const hSizedBox10 = SizedBox(height: 10);
const wSizedBox10 = SizedBox(width: 10);
const hSizedBox15 = SizedBox(height: 15);

class CurrentTaskView extends StatelessWidget {
  const CurrentTaskView({super.key, required this.task});
  final Task? task;

  @override
  Widget build(BuildContext context) {
    final actualTask = task;

    return Visibility(
      visible: actualTask != null,
      child: SizedBox(
          height: 115,
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: context.colorScheme.onBackground,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 17,
                left: 17,
                top: 15,
                bottom: 15,
              ),
              child: actualTask != null
                  ? CurrentTaskContainer(
                      actualTask: actualTask,
                    )
                  : const SizedBox(),
            ),
          )),
    );
  }
}
