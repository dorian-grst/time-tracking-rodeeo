import 'package:hive/hive.dart';

part 'task_state.g.dart';

@HiveType(typeId: 2)
enum TaskState {
  @HiveField(0)
  inProgress,

  @HiveField(1)
  done,

  @HiveField(2)
  notStarted,

  @HiveField(3)
  pause;
}



