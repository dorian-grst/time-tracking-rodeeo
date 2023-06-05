// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagTypeAdapter extends TypeAdapter<TagType> {
  @override
  final int typeId = 2;

  @override
  TagType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TagType.participant;
      case 1:
        return TagType.label;
      default:
        return TagType.participant;
    }
  }

  @override
  void write(BinaryWriter writer, TagType obj) {
    switch (obj) {
      case TagType.participant:
        writer.writeByte(0);
        break;
      case TagType.label:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
