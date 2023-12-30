import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/services/cache_helper.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/usecase/delete_task_usecase.dart';
import 'package:todo/todo/domain/usecase/get_tasks_usecase.dart';
import 'package:todo/todo/domain/usecase/insert_task_usecase.dart';
import 'package:todo/todo/domain/usecase/reorder_tasks_usecase.dart';
import 'package:todo/todo/domain/usecase/satisfy_task_usecase.dart';
import 'package:todo/todo/domain/usecase/search_tasks_usecase.dart';
import 'package:todo/todo/domain/usecase/update_task_usecase.dart';

import '../../../../core/utils/toasts.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  final GetTasksUseCase getTasksUseCase;
  final InsertTaskUseCase insertTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final SatisfyTaskUseCase satisfyTaskUseCase;
  final SearchTasksUseCase searchTasksUseCase;
  final ReorderTasksUseCase reorderTasksUseCase;

  HomeBloc(
    this.getTasksUseCase,
    this.insertTaskUseCase,
    this.deleteTaskUseCase,
    this.updateTaskUseCase,
    this.satisfyTaskUseCase,
    this.searchTasksUseCase,
    this.reorderTasksUseCase,
  ) : super(const HomeState()) {
    on<HomeChangeThemeModeEvent>(_changeThemeMode);
    on<HomeGetTasksEvent>(_getTasks);
    on<HomeInsertTaskEvent>(_insertTask);
    on<HomeDeleteTaskEvent>(_deleteTask);
    on<HomeUpdateTaskEvent>(_updateTask);
    on<HomeSatisfyTaskEvent>(_satisfyTask);
    on<HomeSearchTasksEvent>(_searchTasks);
    on<HomeReorderTasksEvent>(_reOrderTasks);
  }

  FutureOr<void> _changeThemeMode(
      HomeChangeThemeModeEvent event, Emitter<HomeState> emit) {
    MyApp.isDark = !MyApp.isDark;
    CacheHelper.saveData(key: 'isDark', value: MyApp.isDark);
    emit(state.copyWith(isDark: !state.isDark));
  }

  FutureOr<void> _getTasks(
      HomeGetTasksEvent event, Emitter<HomeState> emit) async {
    final result = await getTasksUseCase();
    result.fold((error) {
      emit(state.copyWith(
          tasksError: error.message, tasksState: RequestState.error));
    }, (tasks) {
      List<Task> finalTasks = tasks;
      finalTasks.sort(
        (a, b) {
          if (a.isCompleted == 0 && b.isCompleted == 1) {
            return 0;
          } else if (a.isCompleted == 1 && b.isCompleted == 0) {
            return 1;
          }
          return -1;
        },
      );
      emit(state.copyWith(tasks: finalTasks, tasksState: RequestState.success));
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

  FutureOr<void> _deleteTask(
      HomeDeleteTaskEvent event, Emitter<HomeState> emit) async {
    final result = await deleteTaskUseCase(taskId: event.taskId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          deleteTaskError: error.message,
          deleteTaskState: RequestState.error,
        ),
      );
    }, (message) {
      add(HomeGetTasksEvent());
      showToast(msg: message, requestState: RequestState.success);
      emit(
        state.copyWith(
          deleteTaskMessage: message,
          deleteTaskState: RequestState.success,
        ),
      );
    });
  }

  FutureOr<void> _updateTask(
      HomeUpdateTaskEvent event, Emitter<HomeState> emit) async {
    final result =
        await updateTaskUseCase(task: event.task, taskId: event.taskId);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          updateTaskError: error.message,
          updateTaskState: RequestState.error,
        ),
      );
    }, (message) {
      add(HomeGetTasksEvent());
      showToast(msg: message, requestState: RequestState.success);
      emit(
        state.copyWith(
          updateTaskMessage: message,
          updateTaskState: RequestState.success,
        ),
      );
    });
  }

  FutureOr<void> _satisfyTask(
      HomeSatisfyTaskEvent event, Emitter<HomeState> emit) async {
    final result = await satisfyTaskUseCase(
        taskId: event.taskId, isCompleted: event.isCompleted);
    result.fold((error) {
      showToast(msg: error.message, requestState: RequestState.error);
      emit(
        state.copyWith(
          satisfyTaskError: error.message,
          satisfyTaskState: RequestState.error,
        ),
      );
    }, (message) {
      add(HomeGetTasksEvent());
    });
  }

  FutureOr<void> _searchTasks(
      HomeSearchTasksEvent event, Emitter<HomeState> emit) async {
    final String dateTime = DateFormat('dd/MM/yyyy').format(event.dateTime);
    final result = await searchTasksUseCase(dateTime: dateTime);
    result.fold((error) {
      emit(state.copyWith(
          tasksError: error.message, tasksState: RequestState.error));
    }, (tasks) {
      List<Task> finalTasks = tasks;
      finalTasks.sort(
        (a, b) {
          if (a.isCompleted == 0 && b.isCompleted == 1) {
            return 0;
          } else if (a.isCompleted == 1 && b.isCompleted == 0) {
            return 1;
          }
          return -1;
        },
      );
      emit(state.copyWith(tasks: finalTasks, tasksState: RequestState.success));
    });
  }

  FutureOr<void> _reOrderTasks(
      HomeReorderTasksEvent event, Emitter<HomeState> emit) async{
    final tasks = state.tasks;
    final task = tasks.removeAt(event.oldIndex);
    tasks.insert(event.newIndex, task);
    final result = await reorderTasksUseCase(oldIndex: event.oldIndex, newIndex: event.newIndex);
    result.fold((left) {}, (tasks) {
      emit(state.copyWith(tasks: tasks));
    });
  }
}
