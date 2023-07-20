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

class AddTaskChangeDateEvent extends AddTaskBaseEvent {
  final String dateTime;

  const AddTaskChangeDateEvent(this.dateTime);
}

class AddTaskChangeStartTimeEvent extends AddTaskBaseEvent {
  final String time;

  const AddTaskChangeStartTimeEvent(this.time);
}

class AddTaskChangeEndTimeEvent extends AddTaskBaseEvent {
  final String time;

  const AddTaskChangeEndTimeEvent(this.time);
}

class AddTaskSelectRepeatEvent extends AddTaskBaseEvent {
  final String repeat;

  const AddTaskSelectRepeatEvent(this.repeat);
}

class AddTaskSelectColorEvent extends AddTaskBaseEvent {
  final Color taskColor;

  const AddTaskSelectColorEvent(this.taskColor);
}

class AddTaskInsertEvent extends AddTaskBaseEvent {
  final Task task;
  const AddTaskInsertEvent(this.task);
}
