import 'package:apprentissage/src/components/current_task.dart';
import 'package:apprentissage/src/components/task_list_view.dart';
import 'package:apprentissage/src/components/home_section_todayline.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:apprentissage/src/share/app_text_style.dart';
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
    final currentTaskObserver = ValueNotifier<Task?>(null);
    final Box<Task> taskBox =
        Hive.box<Task>('taskBox'); // Remplacez 'tasks' par le nom de votre boîte de tâches

    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tâche en cours 🍃',
            style: AppTextStyle.title,
          ),
          hSizedBox20,
          ValueListenableBuilder(
            valueListenable: currentTaskObserver,
            builder: (context, currentTask, child) {
              return CurrentTaskView(
                task: currentTask,
              );
            },
          ),
          hSizedBox25,
          HomeSectionTodayline(
            taskListView: TaskListView(
              currentTaskObserver: currentTaskObserver,
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
                currentTaskObserver: currentTaskObserver,
              );
            },
          )),
        ],
      ),
    );
  }
}
