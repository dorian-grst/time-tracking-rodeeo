import 'package:apprentissage/src/components/playPauseButton.dart';
import 'package:apprentissage/src/components/homeSectionTimer.dart';
import 'package:apprentissage/src/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';

class ActualTask extends StatefulWidget {
  const ActualTask({
    super.key,
    required this.timer,
    required this.taskName,
    required this.state,
  });
  final HomeSectionTimer timer;
  final String taskName;
  final ActualTaskColorState state;

  @override
  State<ActualTask> createState() => _ActualTaskState();
}

class _ActualTaskState extends State<ActualTask> {
  bool isPlaying = false;

  void _togglePlaying() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 115,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 17,
              left: 17,
              top: 15,
              bottom: 15,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSectionTimer(isPlaying: isPlaying),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: context.colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.taskName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Tag(
                      nameTag: isPlaying
                          ? ActualTaskColorState.inProgress.state
                          : ActualTaskColorState.pause.state,
                      textColor: isPlaying
                          ? ActualTaskColorState.inProgress.color
                          : ActualTaskColorState.pause.color,
                      backgroundColor: isPlaying
                          ? ActualTaskColorState.inProgress.backgroundColor
                          : ActualTaskColorState.pause.backgroundColor,
                    ),
                    const Spacer(),
                    PlayPauseButton(
                      isPlaying: isPlaying,
                      togglePlaying: _togglePlaying,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

const inProgressColor = Color.fromRGBO(253, 81, 113, 1);
const inProgressBackgroundColor = Color.fromRGBO(255, 239, 241, 100);
const doneColor = Colors.black;
const doneBackgroundColor = Colors.black;
const notStartedColor = Colors.black;
const notStartedBackgroundColor = Colors.black;

enum ActualTaskColorState {
  inProgress(
    state: 'En cours',
    color: inProgressColor,
    backgroundColor: inProgressBackgroundColor,
  ),
  done(
    state: 'Terminé',
    color: doneColor,
    backgroundColor: doneBackgroundColor,
  ),
  notStarted(
    state: 'Pas commencé',
    color: notStartedColor,
    backgroundColor: notStartedBackgroundColor,
  ),
  pause(
    state: 'Pause',
    color: Colors.white,
    backgroundColor: notStartedBackgroundColor,
  );

  final String state;
  final Color color;
  final Color backgroundColor;
  const ActualTaskColorState({
    required this.state,
    required this.color,
    required this.backgroundColor,
  });

  void onPressed() {
    print('pressed : $state');
  }
}
