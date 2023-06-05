import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class EditTaskAddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;
  const EditTaskAddButton({Key? key, this.onPressed, required this.isEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isEnabled ? context.colorScheme.secondary : context.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          child: Icon(
            Icons.add,
            size: 30,
            color: isEnabled ? context.colorScheme.onSecondary : context.colorScheme.background,
          ),
        ),
      ),
    );
  }
}
