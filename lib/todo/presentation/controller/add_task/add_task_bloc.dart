import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/todo/domain/entities/task.dart';
part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskBaseEvent, AddTaskState> {
  AddTaskBloc() : super(const AddTaskState()) {
    on<AddTaskSelectRemindEvent>(_selectRemind);

    on<AddTaskSelectRepeatEvent>(_selectRepeat);

    on<AddTaskSelectColorEvent>(_selectColor);

    on<AddTaskChangeDateEvent>(_changeDate);

    on<AddTaskChangeStartTimeEvent>(_changeStartTime);

    on<AddTaskChangeEndTimeEvent>(_changeEndTime);
  }

  FutureOr<void> _selectRemind(
      AddTaskSelectRemindEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(remind: event.remind));
  }

  FutureOr<void> _selectRepeat(
      AddTaskSelectRepeatEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(repeat: event.repeat));
  }

  FutureOr<void> _selectColor(
      AddTaskSelectColorEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(taskColor: event.taskColor));
  }

  FutureOr<void> _changeDate(
      AddTaskChangeDateEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(dateTime: event.dateTime));
  }

  FutureOr<void> _changeStartTime(
      AddTaskChangeStartTimeEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(startTime: event.time));
  }

  FutureOr<void> _changeEndTime(
      AddTaskChangeEndTimeEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(endTime: event.time));
  }
}
