import 'package:equatable/equatable.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<EventLoadHomePage>((event, emitter) {

    });
  }
}