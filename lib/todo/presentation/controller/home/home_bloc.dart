import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/services/cache_helper.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/usecase/get_tasks_usecase.dart';
import 'package:todo/todo/domain/usecase/insert_task_usecase.dart';

import '../../../../core/utils/toasts.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  final GetTasksUseCase getTasksUseCase;
  final InsertTaskUseCase insertTaskUseCase;
  HomeBloc(
    this.getTasksUseCase,
    this.insertTaskUseCase,
  ) : super(const HomeState()) {
    on<HomeChnageThemeModeEvent>(_changeThemeMode);
    on<HomeChangeDateTimeEvent>(_changeDateTime);
    on<HomeGetTasksEvent>(_getTasks);
    on<HomeInsertTaskEvent>(_insertTask);
  }

  FutureOr<void> _changeThemeMode(
      HomeChnageThemeModeEvent event, Emitter<HomeState> emit) {
    MyApp.isDark = !MyApp.isDark;
    CacheHelper.saveData(key: 'isDark', value: MyApp.isDark);
    emit(state.copyWith(isDark: !state.isDark));
  }

  FutureOr<void> _changeDateTime(
      HomeChangeDateTimeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(dateTime: event.dateTime));
  }

  FutureOr<void> _getTasks(
      HomeGetTasksEvent event, Emitter<HomeState> emit) async {
    final result = await getTasksUseCase();
    result.fold((error) {
      emit(state.copyWith(
          tasksError: error.message, tasksState: RequestState.error));
    }, (tasks) {
      emit(state.copyWith(tasks: tasks, tasksState: RequestState.success));
    });
  }

  FutureOr<void> _insertTask(
      HomeInsertTaskEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        addTaskState: RequestState.loading,
      ),
    );
    final result = await insertTaskUseCase(task: event.task);
    result.fold(
      (error) {
        showToast(msg: error.message, requestState: RequestState.error);
        emit(
          state.copyWith(
            addTaskError: error.message,
            addTaskState: RequestState.error,
          ),
        );
      },
      (message) {
        add(HomeGetTasksEvent());
        showToast(msg: message, requestState: RequestState.success);
        emit(
          state.copyWith(
            addTaskMessage: message,
            addTaskState: RequestState.success,
          ),
        );
      },
    );
  }
}
