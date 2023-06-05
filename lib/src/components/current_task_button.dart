import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CurrentTaskButton extends StatelessWidget {
  const CurrentTaskButton({
    super.key,
    required this.isPlaying,
    required this.onTap,
  });
  final bool isPlaying;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: context.colorScheme.inverseSurface,
      highlightColor: context.colorScheme.inverseSurface,
      color: context.colorScheme.onSurface,
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
      ),
      onPressed: onTap,
    );
  }
}
