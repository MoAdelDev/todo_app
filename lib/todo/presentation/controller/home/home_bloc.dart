import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/services/cache_service.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeChnageThemeModeEvent>(_changeThemeMode);
    on<HomeChangeDateTimeEvent>(_changeDateTime);
  }

  FutureOr<void> _changeThemeMode(
      HomeChnageThemeModeEvent event, Emitter<HomeState> emit) {
    MyApp.isDark = !MyApp.isDark;
    CacheService.saveData(key: 'isDark', value: MyApp.isDark);
    emit(state.copywith(isDark: !state.isDark));
  }

  FutureOr<void> _changeDateTime(
      HomeChangeDateTimeEvent event, Emitter<HomeState> emit) {
    emit(state.copywith(dateTime: event.dateTime));
  }
}
