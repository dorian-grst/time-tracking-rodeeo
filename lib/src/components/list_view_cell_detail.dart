import 'package:apprentissage/src/components/action_button.dart';
import 'package:apprentissage/src/components/list_view_cell_detailbox.dart';
import 'package:apprentissage/src/components/edit_task_view.dart';
import 'package:apprentissage/src/components/list_view_cell.dart';
import 'package:apprentissage/src/components/tag_view.dart';
import 'package:apprentissage/src/components/time_graph.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

const hSizedBox10 = SizedBox(height: 10);
const hSizedBox30 = SizedBox(height: 30);

class ListViewCellDetail extends StatelessWidget {
  const ListViewCellDetail({
    super.key,
    required this.task,
    required this.selectTask,
    required this.deleteTask,
    required this.editTask,
  });

  final Task task;
  final VoidCallback selectTask;
  final VoidCallback deleteTask;
  final VoidCallback editTask;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Détails 🍃',
                style: context.textTheme.titleMedium?.merge(const TextStyle(fontSize: 24)),
              ),
              hSizedBox20,
              Text(
                'Informations',
                style: context.textTheme.titleMedium,
              ),
              hSizedBox15,
              Column(
                children: [
                  Row(
                    children: [
                      ListViewCellDetailbox(
                        data: task.timePrevision,
                        title: 'Prévision de temps',
                        icon: Icons.hourglass_bottom,
                        color: context.colorScheme.primary,
                      ),
                      const Spacer(),
                      ListViewCellDetailbox(
                        data: task.timeSpent,
                        title: 'Temps total passé',
                        icon: Icons.av_timer,
                        color: context.colorScheme.secondary,
                      ),
                    ],
                  ),
                  hSizedBox10,
                  Row(
                    children: [
                      ListViewCellDetailbox(
                        data: task.startDate,
                        title: 'Date de début',
                        icon: Icons.schedule,
                        color: context.colorScheme.primary,
                      ),
                      const Spacer(),
                      ListViewCellDetailbox(
                        data: task.endDate,
                        title: 'Date de fin',
                        icon: Icons.watch_later,
                        color: context.colorScheme.secondary,
                      ),
                    ],
                  ),
                  hSizedBox10,
                  Row(
                    children: [
                      ListViewCellDetailbox(
                        data: task.doneSubtasks,
                        title: 'Sous-tache(s) réalisé(s)',
                        icon: Icons.done,
                        color: context.colorScheme.primary,
                      ),
                      const Spacer(),
                      ListViewCellDetailbox(
                        data: task.globalAdvancement,
                        title: 'Avancé de la tâche',
                        icon: Icons.watch_later,
                        color: context.colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
              hSizedBox20,
              Text(
                'Description',
                style: context.textTheme.titleMedium,
              ),
              hSizedBox15,
              Text(
                task.description,
                style: context.textTheme.bodySmall,
              ),
              hSizedBox20,
              Visibility(
                visible: task.participants.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Participant(s)',
                      style: context.textTheme.titleMedium,
                    ),
                    hSizedBox15,
                    Wrap(
                      spacing: 10, // espacement horizontal entre les tags
                      runSpacing: 5, // espacement vertical entre les tags
                      children: task.participants
                          .map((participant) => TagView(
                                tag: Tag.participant(nameTag: participant.nameTag),
                              ))
                          .toList(),
                    ),
                    hSizedBox20,
                  ],
                ),
              ),
              Visibility(
                visible: task.tags.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tag(s)',
                      style: context.textTheme.titleMedium,
                    ),
                    hSizedBox15,
                    Wrap(
                      spacing: 10, // espacement horizontal entre les tags
                      runSpacing: 5, // espacement vertical entre les tags
                      children: task.tags
                          .map((tag) => TagView(
                                tag: Tag.label(nameTag: tag.nameTag),
                              ))
                          .toList(),
                    ),
                    hSizedBox20,
                  ],
                ),
              ),
              Text(
                'Graphique',
                style: context.textTheme.titleMedium,
              ),
              hSizedBox15,
              TimeGraph(
                timeSpent: int.parse(task.timeSpent.replaceAll(RegExp('[^0-9]'), '')),
                timePrevision: int.parse(task.timePrevision.replaceAll(RegExp('[^0-9]'), '')),
              ),
              hSizedBox35,
              ActionButton(
                textColor: Colors.white,
                backgroundColor: context.colorScheme.primary,
                text: 'Utiliser la tâche',
                onPressed: () {
                  selectTask();
                },
              ),
              hSizedBox20,
              ActionButton(
                textColor: Colors.white,
                backgroundColor: context.colorScheme.secondary,
                text: 'Modifier la tâche',
                onPressed: () {
                  Navigator.pop(context, TaskAction.edit);
                  showModalBottomSheet(
                    backgroundColor: context.colorScheme.background,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: EditTaskView(
                              task: task,
                              onFinishEditingTask: (_) {
                                //???
                              },
                              createMode: false,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              hSizedBox20,
              ActionButton(
                textColor: Colors.white,
                backgroundColor: context.colorScheme.tertiary,
                text: 'Supprimer la tâche',
                onPressed: () {
                  showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Supprimer la tâche ?',
                          style: TextStyle(color: context.colorScheme.onSurface)),
                      content: Text('La suppression est définitive',
                          style: TextStyle(color: context.colorScheme.onSurface)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Retour'),
                        ),
                        TextButton(
                          onPressed: () {
                            deleteTask();
                            debugPrint(taskBox.toString());
                            Navigator.pop(context);
                          },
                          child: Text('Supprimer',
                              style: TextStyle(color: context.colorScheme.tertiary)),
                        ),
                      ],
                    ),
                  );
                },
              ),
              hSizedBox30,
            ],
          ),
        ),
      ),
    );
  }
}
