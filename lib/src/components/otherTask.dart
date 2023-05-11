import 'package:apprentissage/main.dart';
import 'package:apprentissage/src/components/playPauseButton.dart';
import 'package:apprentissage/src/components/homeSectionTimer.dart';
import 'package:apprentissage/src/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';

class OtherTask extends StatefulWidget {
  const OtherTask({
    super.key,
    required this.taskName,
  });
  final String taskName;

  @override
  State<OtherTask> createState() => _OtherTaskState();
}

class _OtherTaskState extends State<OtherTask> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
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
                Row(
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(47, 147, 92, 1),
                          child: Icon(
                            Icons.computer,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.taskName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Tag(
                              nameTag: 'Me',
                              textColor: participantColor,
                              backgroundColor: participantBackgroundColor,
                            ),
                            SizedBox(width: 10),
                            Tag(
                              nameTag: 'Programming',
                              textColor: tagColor,
                              backgroundColor: tagBackgroundColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 100),
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.arrow_outward,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        // Ajoutez votre logique ici
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

const participantColor = Color.fromRGBO(130, 130, 130, 1);
const participantBackgroundColor = Color.fromRGBO(242, 242, 242, 1);
const tagColor = Colors.white;
const tagBackgroundColor = Color.fromRGBO(245, 180, 0, 1);

enum OtherTaskColorTag {
  participant(
    state: 'participant',
    color: participantColor,
    backgroundColor: participantBackgroundColor,
  ),
  tag(
    state: 'tag',
    color: tagColor,
    backgroundColor: tagBackgroundColor,
  );

  final String state;
  final Color color;
  final Color backgroundColor;
  const OtherTaskColorTag({
    required this.state,
    required this.color,
    required this.backgroundColor,
  });

  void onPressed() {
    print('pressed : $state');
  }
}
