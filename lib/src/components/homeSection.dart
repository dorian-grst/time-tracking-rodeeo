import 'package:apprentissage/src/components/actualTask.dart';
import 'package:apprentissage/src/components/otherTask.dart';

import 'package:apprentissage/src/components/homeSectionTimer.dart';
import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

const kSpacer = SizedBox(height: 30);

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tâche en cours 🍃',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            const ActualTask(
              timer: HomeSectionTimer(isPlaying: false),
              taskName: 'Sprint planning',
              state: ActualTaskColorState.inProgress,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Aujourd\'hui',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Colors.transparent,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Voir tout'),
                )
              ],
            ),
            const SizedBox(height: 10),
            const OtherTask(taskName: " planning"),
          ],
        ),
      ),
    );
  }
}
