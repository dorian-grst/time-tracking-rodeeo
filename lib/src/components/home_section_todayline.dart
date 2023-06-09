import 'package:apprentissage/src/components/task_list_view.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

const hSizedBox20 = SizedBox(height: 20);
const hSizedBox10 = SizedBox(height: 10);
const wSizedBox10 = SizedBox(width: 10);

class HomeSectionTodayline extends StatelessWidget {
  const HomeSectionTodayline({super.key, required this.taskListView});

  final TaskListView taskListView;

  void showModalAllTask(BuildContext context) {
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
        return StatefulBuilder(builder: (context, setState) {
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
                      'Toutes les tâches 🍃',
                      style: context.textTheme.titleLarge,
                    ),
                    hSizedBox20,
                    Row(
                      children: const [
                        Text('Trier par'),
                        wSizedBox10,
                        Icon(
                          Icons.arrow_downward,
                          size: 15,
                        ),
                      ],
                    ),
                    hSizedBox10,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: taskListView,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Aujourd\'hui',
          style: context.textTheme.titleMedium,
        ),
        TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurface,
              ),
            ),
            foregroundColor: MaterialStateProperty.all(
              context.colorScheme.onSurface,
            ),
            overlayColor: MaterialStateProperty.all(
              context.colorScheme.inverseSurface,
            ),
          ),
          onPressed: () {
            showModalAllTask(context);
          },
          child: Text(
            'Voir tout',
            style: TextStyle(
              color: context.colorScheme.onSurface,
            ),
          ),
        )
      ],
    );
  }
}
