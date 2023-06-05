import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class EditTaskDeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const EditTaskDeleteButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.tertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Icon(
            Icons.clear,
            size: 30,
            color: context.colorScheme.onTertiary,
          ),
        ),
      ),
    );
  }
}
