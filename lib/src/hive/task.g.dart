// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[0] as String,
      timePrevision: fields[1] as String,
      timeSpent: fields[2] as String,
      startDate: fields[3] as String,
      endDate: fields[4] as String,
      doneSubtasks: fields[5] as String,
      globalAdvancement: fields[6] as String,
      description: fields[7] as String,
      state: fields[8] as TaskState,
      participants: (fields[9] as List).cast<Tag>(),
      tags: (fields[10] as List).cast<Tag>(),
      durationSecond: fields[11] as int,
      activityStartedAt: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.timePrevision)
      ..writeByte(2)
      ..write(obj.timeSpent)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate)
      ..writeByte(5)
      ..write(obj.doneSubtasks)
      ..writeByte(6)
      ..write(obj.globalAdvancement)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.state)
      ..writeByte(9)
      ..write(obj.participants)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.durationSecond)
      ..writeByte(12)
      ..write(obj.activityStartedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
