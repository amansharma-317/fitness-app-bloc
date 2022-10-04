import 'package:fitness_app/model/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasksService {
  Box<Task>? _tasks;
  //Box<Task> tasks = Box<Task>();

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>('tasks');


  }

  List<Task> getTasks() {
      final tasks = _tasks!.values ;
      return tasks.toList();

  }
//null check operator used on a null value
  void addTask(final String task, final String deadline) {
    _tasks!.add(Task(task, false, deadline));
  }

  Future<void> removeTask(final String task) async {
    final taskToRemove = _tasks!.values.firstWhere((element) => element.task == task);
    await taskToRemove.delete();
  }

  Future<void> updateTask(final String task, final String deadline) async {
    final tasktoEdit = _tasks!.values.firstWhere((element) => element.task == task);
    final index = tasktoEdit.key as int;
    await _tasks!.put(index, Task(task, !tasktoEdit.completed, deadline));
  }
}