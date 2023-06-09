import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'dart:async';

abstract class TimableObject {
  Duration get currentDuration;
  bool get isPlaying;
  void Function(bool) get setIsPlaying;
}

class CurrentTaskTimer extends StatefulWidget {
  const CurrentTaskTimer({super.key, required this.timableObject});
  final TimableObject timableObject;

  @override
  State<CurrentTaskTimer> createState() => _CurrentTaskTimerState();
}

class _CurrentTaskTimerState extends State<CurrentTaskTimer> {
  final Duration uneSeconde = const Duration(seconds: 1);
  late final Timer timer;
  bool isPlaying = false;
  Duration get duration => widget.timableObject.currentDuration;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(uneSeconde, (timer) {
      refreshTimer();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void refreshTimer() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: context.textTheme.displayLarge,
    );
  }
}
