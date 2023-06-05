import 'package:apprentissage/src/hive/tag_type.dart';
import 'package:hive/hive.dart';

part 'tag.g.dart'; // Génération du code de sérialisation Hive

@HiveType(typeId: 0) // Identifiant unique pour la classe Tag
class Tag extends HiveObject {
  @HiveField(0) // Indice unique pour chaque champ
  final String nameTag;

  @HiveField(1)
  final TagType type;

  Tag({
    required this.nameTag,
    required this.type,
  });

  Tag.participant({
    required this.nameTag,
  }) : type = TagType.participant;

  Tag.label({
    required this.nameTag,
  }) : type = TagType.label;
}
