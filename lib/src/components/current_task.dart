import 'package:apprentissage/src/components/current_task_panel.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:flutter/material.dart';

const hSizedBox10 = SizedBox(height: 10);
const wSizedBox10 = SizedBox(width: 10);
const hSizedBox15 = SizedBox(height: 15);

class CurrentTaskView extends StatelessWidget {
  const CurrentTaskView({super.key, required this.currentTaskIndex});
  final dynamic currentTaskIndex;

  @override
  Widget build(BuildContext context) {
    late final currentTask = currentTaskIndex != null ? taskBox.get(currentTaskIndex) : null;
    return Visibility(
      visible: currentTaskIndex != null,
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
            child: currentTask != null
                ? CurrentTaskPanel(
                    currentTaskIndex: currentTaskIndex,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
