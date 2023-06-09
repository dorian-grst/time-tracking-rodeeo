import 'package:hive_flutter/hive_flutter.dart';

part 'tag_type.g.dart';

@HiveType(typeId: 3)
enum TagType {
  @HiveField(0)
  participant,

  @HiveField(1)
  label,
}
