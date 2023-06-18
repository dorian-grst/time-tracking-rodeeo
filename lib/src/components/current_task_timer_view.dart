import 'dart:async';

import 'package:flutter/material.dart';

class CurrentTaskTimerView extends StatefulWidget {
  const CurrentTaskTimerView({
    super.key,
    required this.initialDuration,
    required this.startTime,
  });
  final Duration initialDuration;
  final DateTime? startTime;

  @override
  State<CurrentTaskTimerView> createState() => _CurrentTaskTimerViewState();
}

class _CurrentTaskTimerViewState extends State<CurrentTaskTimerView> {
  DateTime? _current;
  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _current = widget.startTime;
    if (_current != null) {
      _timer = Timer.periodic(const Duration(seconds: 1), increment);
    } else {
      _timer = Timer(const Duration(microseconds: 1), () {});
    }
  }

  void increment(Timer t) {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer?.isActive ?? false) _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return TimerDisplay(
      currentStartTime: _current,
      formerTaskDuration: widget.initialDuration,
    );
  }
}

class TimerDisplay extends StatelessWidget {
  const TimerDisplay({
    super.key,
    required this.formerTaskDuration,
    required this.currentStartTime,
  });
  final Duration formerTaskDuration;
  final DateTime? currentStartTime;

  bool get isPlaying => currentStartTime != null;

  @override
  Widget build(BuildContext context) {
    final current = currentStartTime;

    final increment =
        current != null ? DateTime.now().difference(current) : Duration.zero;

    final actualDuration = formerTaskDuration + increment;

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(actualDuration.inHours);
    final minutes = twoDigits(actualDuration.inMinutes.remainder(60));
    final seconds = twoDigits(actualDuration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: const TextStyle(color: Colors.black, fontSize: 32),
    );
  }
}
