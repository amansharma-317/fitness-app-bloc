part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class EventLoadHomePage extends AppEvent {
  const EventLoadHomePage();

  @override
  List<Object?> get props => [];
}