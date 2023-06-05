import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/tag_type.dart';
import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({super.key, required this.tag});

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    Color getTagTextColor(TagType type, BuildContext context) {
      switch (type) {
        case TagType.participant:
          return context.colorScheme.errorContainer; // Couleur pour le type "participant"
        case TagType.label:
          return context.colorScheme.onBackground; // Couleur pour le type "label"
        default:
          return context
              .colorScheme.onBackground; // Couleur par défaut si le type n'est pas reconnu
      }
    }

    Color getTagBackgroundColor(TagType type, BuildContext context) {
      switch (type) {
        case TagType.participant:
          return context.colorScheme.surface; // Couleur pour le type "participant"
        case TagType.label:
          return context.colorScheme.secondary; // Couleur pour le type "label"
        default:
          return context
              .colorScheme.errorContainer; // Couleur par défaut si le type n'est pas reconnu
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
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: getTagTextColor(tag.type, context),
        ),
      ),
    );
  }
}
