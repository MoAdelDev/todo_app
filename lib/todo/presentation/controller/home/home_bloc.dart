import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/services/cache_helper.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/usecase/get_tasks_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  final GetTasksUseCase getTasksUseCase;
  HomeBloc(
    this.getTasksUseCase,
  ) : super(const HomeState()) {
    on<HomeChnageThemeModeEvent>(_changeThemeMode);
    on<HomeChangeDateTimeEvent>(_changeDateTime);
    on<HomeGetTasksEvent>(_getTasks);
  }

  FutureOr<void> _changeThemeMode(
      HomeChnageThemeModeEvent event, Emitter<HomeState> emit) {
    MyApp.isDark = !MyApp.isDark;
    CacheHelper.saveData(key: 'isDark', value: MyApp.isDark);
    emit(state.copywith(isDark: !state.isDark));
  }

  FutureOr<void> _changeDateTime(
      HomeChangeDateTimeEvent event, Emitter<HomeState> emit) {
    emit(state.copywith(dateTime: event.dateTime));
  }

  FutureOr<void> _getTasks(
      HomeGetTasksEvent event, Emitter<HomeState> emit) async {
    final result = await getTasksUseCase();
    result.fold((error) {
      emit(state.copywith(
          tasksError: error.message, tasksState: RequestState.error));
    }, (tasks) {
      emit(state.copywith(tasks: tasks, tasksState: RequestState.success));
    });
  }
}
