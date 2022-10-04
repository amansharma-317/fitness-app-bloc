part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {

  const TaskInitial();

  @override
  List<Object?> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<Task> tasks;

  const TaskLoadedState(this.tasks);

  @override
  List<Object?> get props => ['tasks'];
}

class TaskLoading extends TaskState {

  const TaskLoading();

  @override
  List<Object?> get props => [];
}

class TaskLoadingError extends TaskState {
  final String error;

  const TaskLoadingError(this.error);

  @override
  List<Object?> get props => ['error'];
}