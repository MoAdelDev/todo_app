part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final int remind;
  final String repeat;
  final Color taskColor;

  const AddTaskState({
    this.remind = 5,
    this.repeat = 'None',
    this.taskColor = AppColor.bluishColor,
  });

  AddTaskState copyWith({int? remind, String? repeat, Color? taskColor}) =>
      AddTaskState(
        remind: remind ?? this.remind,
        repeat: repeat ?? this.repeat,
        taskColor: taskColor ?? this.taskColor,
      );

  @override
  List<Object?> get props => [
        remind,
        repeat,
        taskColor,
      ];
}
