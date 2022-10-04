part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class EventLoadTasks extends TaskEvent {

  const EventLoadTasks();

  @override
  List<Object?> get props => [];
}