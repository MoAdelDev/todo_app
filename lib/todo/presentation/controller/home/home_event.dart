part of 'home_bloc.dart';

abstract class HomeBaseEvent extends Equatable {
  const HomeBaseEvent();

  @override
  List<Object> get props => [];
}

class HomeChnageThemeModeEvent extends HomeBaseEvent {}

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
