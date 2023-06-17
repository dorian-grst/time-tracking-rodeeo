import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/task_list_view.dart';
import 'package:apprentissage/src/components/home_section_todayline.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const kSpacer = SizedBox(height: 30);
const wSizedBox10 = SizedBox(width: 10);
const hSizedBox10 = SizedBox(height: 10);
const hSizedBox20 = SizedBox(height: 20);
const hSizedBox25 = SizedBox(height: 25);

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.onSelectTask});

  final VoidCallback onSelectTask;

  @override
  Widget build(BuildContext context) {
    //final currentTaskObserver = ValueNotifier<Task?>(null);
    final currentTaskIndexObserver = ValueNotifier<dynamic>(null);
    final Box<Task> taskBox =
        Hive.box<Task>('taskBox'); // Remplacez 'tasks' par le nom de votre boîte de tâches

    /* Task? currentTask(dynamic currentIndex) {
      return currentIndex != null ? taskBox.get(currentIndex) : null;
    } */

    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tâche en cours 🍃',
            style: context.textTheme.titleLarge,
          ),
          hSizedBox20,
          ValueListenableBuilder(
            valueListenable: currentTaskIndexObserver,
            builder: (context, currentIndex, child) {
              return CurrentTaskView(
                currentTaskIndex: currentIndex,
              );
            },
          ),
          hSizedBox25,
          HomeSectionTodayline(
            taskListView: TaskListView(
              currentTaskIndexObserver: currentTaskIndexObserver,
            ),
          ),
          hSizedBox10,
          Expanded(
              // child: ValueListenableBuilder<List<Task>>(
              //   valueListenable: ,
              //   builder: (context, tasks, child) {
              //     return TaskListView(
              //       currentTaskObserver: currentTaskObserver,
              //     );
              //   },
              // ),
              child: ValueListenableBuilder<Box<Task>>(
            valueListenable: taskBox.listenable(),
            builder: (context, box, _) {
              return TaskListView(
                currentTaskIndexObserver: currentTaskIndexObserver,
              );
            },
          )),
        ],
      ),
    );
  }
}
