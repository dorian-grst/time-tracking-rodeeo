import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs

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
  int durationSecond;

  @HiveField(12)
  int activityStartedAt;

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

  Future<void> saveWith({
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
  }) async {
    final newTask = copyWith(
      name: name,
      timePrevision: timePrevision,
      timeSpent: timeSpent,
      startDate: startDate,
      endDate: endDate,
      doneSubtasks: doneSubtasks,
      globalAdvancement: globalAdvancement,
      description: description,
      participants: participants,
      tags: tags,
      state: state,
      durationSecond: durationSecond,
      activityStartedAt: activityStartedAt,
    );
    if (key == null) {
      taskBox.add(newTask);
    } else {
      taskBox.put(key, newTask);
    }
    await newTask.save();
  }

  bool get isStarted => activityStartedAt != 0;

  int get nowSinceEpoch => DateTime.now().millisecondsSinceEpoch;

  Duration get storedDuration => Duration(seconds: durationSecond);

  void addDuration(Duration duration) {
    durationSecond = duration.inSeconds;
  }

  DateTime? get sessionStartDate =>
      isStarted ? DateTime.fromMillisecondsSinceEpoch(activityStartedAt) : null;

  void startSession() {
    if (isStarted) return;
    activityStartedAt = DateTime.now().millisecondsSinceEpoch;
  }

  void stopSession() {
    final start = sessionStartDate;
    if (start != null) {
      activityStartedAt = 0;
      final now = DateTime.now();
      final sessionDuration = now.difference(start);
      durationSecond += sessionDuration.inSeconds;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'timePrevision': timePrevision,
      'timeSpent': timeSpent,
      'startDate': startDate,
      'endDate': endDate,
      'doneSubtasks': doneSubtasks,
      'globalAdvancement': globalAdvancement,
      'description': description,
      'state': state.toString(), // Convertir TaskState en chaîne de caractères
      'participants':
          participants.map((participant) => participant.toMap()).toList(),
      'tags': tags.map((tag) => tag.toMap()).toList(),
      'durationSecond': durationSecond,
      'activityStartedAt': activityStartedAt,
    };
  }
}
