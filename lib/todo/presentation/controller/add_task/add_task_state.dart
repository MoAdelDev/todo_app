part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final int remind;
  final String repeat;
  final Color taskColor;
  final String dateTime;
  final String startTime;
  final String endTime;

  const AddTaskState({
    this.remind = 5,
    this.repeat = 'None',
    this.taskColor = LightColor.primaryColor,
    this.dateTime = '',
    this.startTime = '',
    this.endTime = '',
  });

  AddTaskState copyWith({
    int? remind,
    String? repeat,
    Color? taskColor,
    String? dateTime,
    String? startTime,
    String? endTime,
  }) =>
      AddTaskState(
        remind: remind ?? this.remind,
        repeat: repeat ?? this.repeat,
        taskColor: taskColor ?? this.taskColor,
        dateTime: dateTime ?? this.dateTime,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  @override
  List<Object?> get props => [
        remind,
        repeat,
        taskColor,
        dateTime,
        startTime,
        endTime,
      ];
}
