import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calendrier 🍃',
            style: context.textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
