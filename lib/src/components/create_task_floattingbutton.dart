import 'package:apprentissage/src/components/edit_task_view.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

const wSizedBox10 = SizedBox(width: 10);
const hSizedBox10 = SizedBox(height: 10);
const hSizedBox20 = SizedBox(height: 20);
const hSizedBox30 = SizedBox(height: 30);

class CreateTaskFloatingButton extends StatefulWidget {
  const CreateTaskFloatingButton({
    Key? key,
    required this.tabIndex,
    required this.onCreatedTask,
  }) : super(key: key);
  final ValueNotifier<int> tabIndex;
  final void Function(Task?) onCreatedTask;

  @override
  State<CreateTaskFloatingButton> createState() => _CreateTaskFloatingButtonState();
}

class _CreateTaskFloatingButtonState extends State<CreateTaskFloatingButton> {
  Future<dynamic> showModalCreateTask(BuildContext context) async {
    final newTask = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: context.colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: EditTaskView(
                  task: Task.defaultTask(),
                  onFinishEditingTask: (_) {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          }),
        );
      },
    );
    return newTask;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.tabIndex,
      builder: (context, selectedIndex, child) {
        return Visibility(
          visible: selectedIndex == 1,
          child: FloatingActionButton(
            onPressed: () async {
              var newTask = await showModalCreateTask(context);
              widget.onCreatedTask(newTask);
            },
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onBackground,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
