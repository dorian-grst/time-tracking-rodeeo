import 'package:hive_flutter/hive_flutter.dart';

part 'tag_type.g.dart';

@HiveType(typeId: 2)
enum TagType {
  @HiveField(0)
  participant,

  @HiveField(1)
  label,
}
