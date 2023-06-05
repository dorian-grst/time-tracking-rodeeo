import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String timePrevision;

  @HiveField(2)
  final String timeSpent;

  @HiveField(3)
  final String startDate;

  @HiveField(4)
  final String endDate;

  @HiveField(5)
  final String doneSubtasks;

  @HiveField(6)
  final String globalAdvancement;

  @HiveField(7)
  final String description;

  @HiveField(8)
  final TaskState state;

  @HiveField(9)
  final List<Tag> participants;

  @HiveField(10)
  final List<Tag> tags;

  @HiveField(11)
  final int durationSecond;

  @HiveField(12)
  final int activityStartedAt;

  Task({
    required this.name,
    required this.timePrevision,
    required this.timeSpent,
    required this.startDate,
    required this.endDate,
    required this.doneSubtasks,
    required this.globalAdvancement,
    required this.description,
    required this.state,
    required this.participants,
    required this.tags,
    required this.durationSecond,
    required this.activityStartedAt,
  });

  Task.defaultTask()
      : name = 'Default task',
        timePrevision = '10h',
        timeSpent = '0h',
        startDate = '24/03/02',
        endDate = '25/03/02',
        doneSubtasks = '0',
        globalAdvancement = '0%',
        description = 'Default description',
        participants = [],
        tags = [],
        state = TaskState.notStarted,
        durationSecond = 0,
        activityStartedAt = 0;

  Duration get duration => Duration(seconds: durationSecond);

  Task start(bool value) {
    return copyWith(state: value ? TaskState.inProgress : TaskState.pause);
  }

  Task copyWith({
    String? name,
    String? timePrevision,
    String? timeSpent,
    String? startDate,
    String? endDate,
    String? doneSubtasks,
    String? globalAdvancement,
    String? description,
    List<Tag>? participants,
    List<Tag>? tags,
    TaskState? state,
    int? durationSecond,
    int? activityStartedAt,
  }) {
    return Task(
      name: name ?? this.name,
      timePrevision: timePrevision ?? this.timePrevision,
      timeSpent: timeSpent ?? this.timeSpent,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      doneSubtasks: doneSubtasks ?? this.doneSubtasks,
      globalAdvancement: globalAdvancement ?? this.globalAdvancement,
      description: description ?? this.description,
      participants: participants ?? this.participants,
      tags: tags ?? this.tags,
      state: state ?? this.state,
      durationSecond: durationSecond ?? this.durationSecond,
      activityStartedAt: activityStartedAt ?? this.activityStartedAt,
    );
  }

  void startTask() {
    if (isStarted) {
      return;
    }
    final task = copyWith(
      activityStartedAt: nowSinceEpoch,
    );
    task.save();
  }

  void stopTask() {
    if (isStarted == false) {
      return;
    }
    final duration = durationSecond + (nowSinceEpoch - activityStartedAt);
    final task = copyWith(
      durationSecond: duration,
      activityStartedAt: 0,
    );
    task.save();
  }

  bool get isStarted => activityStartedAt != 0;
  int get nowSinceEpoch => DateTime.now().millisecondsSinceEpoch ~/ 1000;
  Duration get durationSinceStart => Duration(seconds: durationSecond);
}
