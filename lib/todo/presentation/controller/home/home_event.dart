part of 'home_bloc.dart';

abstract class HomeBaseEvent extends Equatable {
  const HomeBaseEvent();

  @override
  List<Object> get props => [];
}

class HomeChangeThemeModeEvent extends HomeBaseEvent {}


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

class HomeSatisfyTaskEvent extends HomeBaseEvent {
  final int taskId;
  final int isCompleted;

  const HomeSatisfyTaskEvent(this.taskId, this.isCompleted);
}

class HomeSearchTasksEvent extends HomeBaseEvent {
  final DateTime dateTime;

  const HomeSearchTasksEvent(this.dateTime);
}

class HomeReorderTasksEvent extends HomeBaseEvent{
  final int oldIndex;
  final int newIndex;
  const HomeReorderTasksEvent(this.oldIndex, this.newIndex);
}
