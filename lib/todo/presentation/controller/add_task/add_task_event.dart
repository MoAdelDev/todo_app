part of 'add_task_bloc.dart';

abstract class AddTaskBaseEvent extends Equatable {
  const AddTaskBaseEvent();
  @override
  List<Object?> get props => [];
}

class AddTaskSelectRemindEvent extends AddTaskBaseEvent {
  final int remind;

  const AddTaskSelectRemindEvent(this.remind);
}

class AddTaskSelectRepeatEvent extends AddTaskBaseEvent {
  final String repeat;

  const AddTaskSelectRepeatEvent(this.repeat);
}

class AddTaskSelectColorEvent extends AddTaskBaseEvent {
  final Color taskColor;

  const AddTaskSelectColorEvent(this.taskColor);
}
