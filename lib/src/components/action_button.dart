import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.textColor,
      required this.backgroundColor,
      required this.text,
      required this.onPressed});
  final Color textColor;
  final Color backgroundColor;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: context.textTheme.labelMedium?.copyWith(
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
