import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/style/colors.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskBaseEvent, AddTaskState> {
  AddTaskBloc() : super(const AddTaskState()) {
    on<AddTaskSelectRemindEvent>(_selectRemind);

    on<AddTaskSelectRepeatEvent>(_selectRepeat);

    on<AddTaskSelectColorEvent>(_selectColor);
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
}
