import 'package:todo/core/error/error_message_model.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/services/database_helper.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseDataSource {
  Future<String> insertTask({required Task task});
}

class TodoDataSource extends TodoBaseDataSource {
  @override
  Future<String> insertTask({required Task task}) async {
    final result = await DatabaseHelper.database?.insert('Todo', task.toMap());

    if (result != null) {
      print('Id :: $result');
      return 'Task added successfully';
    }
    throw ServerException(
        const ErrorMessageModel('Error to add task, try again'));
  }
}
