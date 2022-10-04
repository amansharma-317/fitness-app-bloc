import 'package:equatable/equatable.dart';
import 'package:fitness_app/services/tasks.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/task.dart';

part 'task_state.dart';
part 'task_event.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TasksService _tasksService;
  TaskBloc(this._tasksService) : super(TaskInitial()) {
    on<EventLoadTasks>((event, emitter) {
      try {
        final tasks =  _tasksService.getTasks();
        emit(TaskLoadedState(tasks));
      } catch (e) {
        emit(TaskLoadingError(e.toString()));
      }
    });
  }
}

//LateInitializationError: Field '_task@31384794' has not been initialized