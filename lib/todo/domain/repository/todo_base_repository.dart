import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseRepository {
  Future<Either<Failure, String>> insertTask({
    required Task task,
  });

  Future<Either<Failure, String>> updateTask({
    required Task task,
    required int taskId,
  });

  Future<Either<Failure, List<Task>>> getTasks();

  Future<Either<Failure, String>> deleteTask({
    required int taskId,
  });

  Future<Either<Failure, void>> satisfyTask({
    required int taskId,
    required int isCompleted,
  });

  Future<Either<Failure, List<Task>>> searchTasks({
    required String dateTime,
  });
  Future<Either<Failure, List<Task>>> reorderTasks({required int oldIndex, required int newIndex});
}
