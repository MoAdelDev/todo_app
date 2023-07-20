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
    await DatabaseHelper.database?.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO Todo(title, note, isCompleted, date, startTime, endTime, color, remind, repeat) VALUES(${task.title},${task.note},${task.isCompleted},${task.dueDate},${task.startTime},${task.endTime},${task.color},${task.remind},${task.repeat})',
      )
          .then((value) {
        return 'Task added successfully';
      }).catchError((error) {
        throw ServerException(ErrorMessageModel.fromJson(error.toString()));
      });
    });
    return '';
  }
}
