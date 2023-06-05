import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:flutter/material.dart';

class StateInfoPanel extends StatelessWidget {
  const StateInfoPanel({
    super.key,
    required this.taskState,
  });

  final TaskState taskState;

  @override
  Widget build(BuildContext context) {
    String getTaskStateString(TaskState state) {
      switch (state) {
        case TaskState.inProgress:
          return "En cours";
        case TaskState.done:
          return "Finie";
        case TaskState.notStarted:
          return "Pas commencée";
        case TaskState.pause:
          return "Pause";
        default:
          return "État inconnu";
      }
    }

    Color getStateBackgroundColor(TaskState state) {
      switch (state) {
        case TaskState.inProgress:
          return context.colorScheme.onError; // Couleur pour l'état "inProgress"
        case TaskState.done:
          return context.colorScheme.onPrimary; // Couleur pour l'état "done"
        case TaskState.notStarted:
          return context.colorScheme.errorContainer; // Couleur pour l'état "notStarted"
        case TaskState.pause:
          return context.colorScheme.onSurface; // Couleur pour l'état "pause"
        default:
          return context
              .colorScheme.errorContainer; // Couleur par défaut si l'état n'est pas reconnu
      }
    }

    Color getStateTextColor(TaskState state) {
      switch (state) {
        case TaskState.inProgress:
          return context.colorScheme.tertiary; // Couleur pour l'état "inProgress"
        case TaskState.done:
          return context.colorScheme.primary; // Couleur pour l'état "done"
        case TaskState.notStarted:
          return context.colorScheme.onBackground; // Couleur pour l'état "notStarted"
        case TaskState.pause:
          return context.colorScheme.onBackground; // Couleur pour l'état "pause"
        default:
          return context
              .colorScheme.errorContainer; // Couleur par défaut si l'état n'est pas reconnu
      }
    }

    final textColor = getStateTextColor(taskState);
    final backgroundColor = getStateBackgroundColor(taskState);
    final text = getTaskStateString(taskState);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}