import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
    required this.isPlaying,
    required this.togglePlaying,
  });

  final bool isPlaying;
  final void Function() togglePlaying;

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: Icon(
        widget.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
      onPressed: widget.togglePlaying,
    );
  }
}
