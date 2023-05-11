import 'package:flutter/material.dart';
import 'dart:async';

class HomeSectionTimer extends StatefulWidget {
  const HomeSectionTimer({super.key, required this.isPlaying});
  final bool isPlaying;

  @override
  State<HomeSectionTimer> createState() => _HomeSectionTimeState();
}

class _HomeSectionTimeState extends State<HomeSectionTimer> {
  final Duration uneSeconde = const Duration(seconds: 1);
  Timer? timer;
  int counter = 0;
  Duration duration = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPlaying) {
      startTimer();
    }
  }

  @override
  void didUpdateWidget(HomeSectionTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying != oldWidget.isPlaying) {
      if (widget.isPlaying) {
        startTimer();
      } else {
        stopTimer();
      }
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
      duration = duration + uneSeconde;
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

    return RepaintBoundary(
      child: Text(
        '$hours:$minutes:$seconds',
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
