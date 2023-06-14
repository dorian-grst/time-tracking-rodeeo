import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/tag_type.dart';
import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    Color getTagBackgroundColor(TagType type, BuildContext context) {
      switch (type) {
        case TagType.participant:
          return context.colorScheme.errorContainer;
        case TagType.label:
          return context.colorScheme.secondary;
        default:
          return context
              .colorScheme.errorContainer;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: getTagBackgroundColor(tag.type, context),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag.nameTag,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
