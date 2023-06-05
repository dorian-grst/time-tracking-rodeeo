import 'package:apprentissage/src/share/app_text_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CurrentTaskTimer extends StatefulWidget {
  const CurrentTaskTimer({super.key, required this.isPlaying, required this.durationSecond});
  final bool isPlaying;
  final int durationSecond;

  @override
  State<CurrentTaskTimer> createState() => _CurrentTaskTimerState();
}

class _CurrentTaskTimerState extends State<CurrentTaskTimer> {
  final Duration uneSeconde = const Duration(seconds: 1);
  Timer? timer;
  int counter = 0;
  Duration duration = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    duration = Duration(seconds: widget.durationSecond);
    if (widget.isPlaying) {
      startTimer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  void addTime() {
    if (!mounted || !widget.isPlaying) {
      return;
    }
    setState(() {
      duration += uneSeconde;
    });
  }

  void startTimer() {
    timer = Timer.periodic(uneSeconde, (_) => addTime());
  }

  void stopTimer() {
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: AppTextStyle.timer.merge(
        const TextStyle(
          height: 1,
        ),
      ),
    );
  }
}
