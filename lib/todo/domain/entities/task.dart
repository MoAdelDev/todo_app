import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String title;
  final String note;
  final bool isCompleted;
  final String dueDate;
  final String startTime;
  final String endTime;
  final int color;
  final String repeat;
  final String remind;

  const Task(
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.dueDate,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  );

  Map<String, dynamic> toMap() => {
        'title': title,
        'note': note,
        'isCompleted': isCompleted,
        'date': dueDate,
        'startTime': startTime,
        'endTime': endTime,
        'color': color,
        'remind': remind,
        'repeat': repeat,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        isCompleted,
        startTime,
        endTime,
        color,
        dueDate,
      ];
}
