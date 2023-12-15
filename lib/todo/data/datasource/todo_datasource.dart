import 'package:todo/core/error/error_message_model.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/services/database_helper.dart';
import 'package:todo/todo/data/models/task_model.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseDataSource {
  Future<String> insertTask({required Task task});

  Future<List<Task>> getTasks();

  Future<String> deleteTask({required int taskId});
}

class TodoDataSource extends TodoBaseDataSource {
  @override
  Future<String> insertTask({required Task task}) async {
    final result = await DatabaseHelper.database?.insert('Todo', task.toMap());

    if (result != null) {
      return 'Task added successfully';
    }
    throw ServerException(
        const ErrorMessageModel('Error to add task, try again'));
  }

  @override
  Future<List<Task>> getTasks() async {
    final result =
        await DatabaseHelper.database?.rawQuery('SELECT * FROM Todo');

    if (result != null) {
      return List.from((result).map((e) => TaskModel.fromMap(e)));
    }
    throw ServerException(
        const ErrorMessageModel('Failed to get tasks, try again'));
  }

  @override
  Future<String> deleteTask({required int taskId}) async{
    final result = await DatabaseHelper.database?.delete('Todo', where: 'id = ?', whereArgs: [taskId]);

    if (result != null) {
      return 'Task deleted successfully';
    }
    throw ServerException(
        const ErrorMessageModel('Error to delete task, try again'));
  }
}
