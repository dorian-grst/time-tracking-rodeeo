import 'dart:async';
import 'package:apprentissage/src/components/bottom_navbar.dart';
import 'package:apprentissage/src/components/export_section.dart';
import 'package:apprentissage/src/components/create_task_floattingbutton.dart';
import 'package:apprentissage/src/components/home_section.dart';
import 'package:apprentissage/src/components/parameter_section.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

class TimeTrackerHomePage extends StatefulWidget {
  const TimeTrackerHomePage({super.key});

  @override
  State<TimeTrackerHomePage> createState() => _TimeTrackerHomePageState();
}

class _TimeTrackerHomePageState extends State<TimeTrackerHomePage> {
  final ValueNotifier<Timer?> timerNotifier = ValueNotifier<Timer?>(null);
  final taskListObserver = ValueNotifier<List<Task>>(<Task>[]);
  late Task _currentTask;

  set currentTask(Task newValue) {
    if (newValue == _currentTask) return;
    setState(() {
      _currentTask = newValue;
    });
  }

  Task get currentTask => _currentTask;

  @override
  void initState() {
    super.initState();
    _currentTask = Task.defaultTask();
  }

  void saveNewTask(Task task) {
    setState(() {
      taskBox.put('key_${task.name}', task);
    });
  }

  @override
  void dispose() {
    timerNotifier.value?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabIndexNotifier = ValueNotifier<int>(1);
    final homeSection = HomeSection(
      onSelectTask: () {},
    );

    return Scaffold(
      backgroundColor: context.colorScheme.background,
      body: ValueListenableBuilder<int>(
        valueListenable: tabIndexNotifier,
        builder: (context, selectedIndex, child) {
          if (selectedIndex == 0) {
            return const ParameterSection();
          } else if (selectedIndex == 1) {
            return homeSection;
          } else if (selectedIndex == 2) {
            return const ExportSection();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: tabIndexNotifier,
          builder: (context, selectedIndex, child) {
            return BottomNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (index) {
                tabIndexNotifier.value = index;
              },
            );
          }),
      floatingActionButton: CreateTaskFloatingButton(
        tabIndex: tabIndexNotifier,
        onCreatedTask: (task) => {if (task != null) saveNewTask(task)},
      ),
    );
  }
}
