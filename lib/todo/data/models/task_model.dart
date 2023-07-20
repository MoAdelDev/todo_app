import 'package:todo/todo/domain/entities/task.dart';

class TaskModel extends Task {
  const TaskModel(
      super.id,
      super.title,
      super.note,
      super.isCompleted,
      super.dueDate,
      super.startTime,
      super.endTime,
      super.color,
      super.remind,
      super.repeat);

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      json['id'],
      json['title'],
      json['note'],
      json['isCompleted'],
      json['date'],
      json['startTime'],
      json['endTime'],
      json['color'],
      json['remind'],
      json['repeat']);
}
