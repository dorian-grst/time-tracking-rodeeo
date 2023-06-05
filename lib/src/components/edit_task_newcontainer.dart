import 'package:apprentissage/src/components/edit_task_deletebutton.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class EditTaskNewcontainer extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const EditTaskNewcontainer({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            width: 307,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.onBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          EditTaskDeleteButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
