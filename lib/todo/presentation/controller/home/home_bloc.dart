import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/services/cache_service.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeChnageThemeModeEvent>(_changeThemeMode);
    on<HomeChangeDateTimeEvent>(_changeDateTime);
    on<HomeGetTasksEvent>(_getTasks);
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

  FutureOr<void> _getTasks(HomeGetTasksEvent event, Emitter<HomeState> emit) {
    emit(state.copywith(tasks: [
      Task(
        1,
        'Mohammed Abdelaziz ',
        'This is is is note note welcome to Cairot',
        false,
        DateFormat('hh:mm')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        DateFormat('hh:mm')
            .format(DateTime.now().add(const Duration(minutes: 1)))
            .toString(),
        Colors.orange,
      ),
    ]));
  }
}
