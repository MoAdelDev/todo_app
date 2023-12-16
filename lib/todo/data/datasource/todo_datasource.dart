import 'package:todo/core/error/error_message_model.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/services/database_helper.dart';
import 'package:todo/todo/data/models/task_model.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseDataSource {
  Future<String> insertTask({required Task task});

  Future<String> updateTask({required Task task, required int taskId});

  Future<List<Task>> getTasks();

  Future<String> deleteTask({required int taskId});

  Future<void> satisfyTask({required int taskId, required int isCompleted});

  Future<List<Task>> searchTasks({required String dateTime});
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
  Future<String> deleteTask({required int taskId}) async {
    final result = await DatabaseHelper.database
        ?.delete('Todo', where: 'id = ?', whereArgs: [taskId]);

    if (result != null) {
      return 'Task deleted successfully';
    }
    throw ServerException(
        const ErrorMessageModel('Error to delete task, try again'));
  }

  @override
  Future<String> updateTask({required Task task, required int taskId}) async {
    final result = await DatabaseHelper.database
        ?.update('Todo', task.toMap(), where: 'id = ?', whereArgs: [taskId]);
    if (result != null) {
      return 'Task updated successfully';
    }
    throw ServerException(
        const ErrorMessageModel('Error to update task, try again'));
  }

  @override
  Future<void> satisfyTask(
      {required int taskId, required int isCompleted}) async {
    final result = await DatabaseHelper.database?.update(
        'Todo', {'isCompleted': isCompleted},
        where: 'id = ?', whereArgs: [taskId]);
    if (result != null) {
      return;
    }
    throw ServerException(
        const ErrorMessageModel('Error to update task, try again'));
  }

  @override
  Future<List<Task>> searchTasks({required String dateTime}) async
  {
    final result = await DatabaseHelper.database?.query('Todo', where: 'date = ?', whereArgs: [dateTime]);

    if (result != null) {
      return List.from((result).map((e) => TaskModel.fromMap(e)));
    }
    throw ServerException(
        const ErrorMessageModel('Error to update task, try again'));
  }
}
