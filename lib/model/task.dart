import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String task;
  @HiveField(1)
  final bool completed;
  @HiveField(2)
  final String deadline;

  Task(this.task, this.completed, this.deadline);
}