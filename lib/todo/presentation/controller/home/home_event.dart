part of 'home_bloc.dart';

abstract class HomeBaseEvent extends Equatable {
  const HomeBaseEvent();

  @override
  List<Object> get props => [];
}

class HomeChangeThemeModeEvent extends HomeBaseEvent {}

class HomeChangeDateTimeEvent extends HomeBaseEvent {
  final DateTime dateTime;

  const HomeChangeDateTimeEvent(this.dateTime);
}

class HomeShowBottomSheetEvent extends HomeBaseEvent {}

class HomeGetTasksEvent extends HomeBaseEvent {}

class HomeInsertTaskEvent extends HomeBaseEvent {
  final Task task;

  const HomeInsertTaskEvent(this.task);
}

class HomeDeleteTaskEvent extends HomeBaseEvent {
  final int taskId;

  const HomeDeleteTaskEvent(this.taskId);
}

class HomeUpdateTaskEvent extends HomeBaseEvent {
  final Task task;
  final int taskId;

  const HomeUpdateTaskEvent(this.task, this.taskId);
}