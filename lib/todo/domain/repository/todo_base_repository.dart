import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseRepository {
  Future<Either<Failure, String>> insertTask({
    required Task task,
  });

  Future<Either<Failure, List<Task>>> getTasks();

  Future<Either<Failure, String>> deleteTask({
    required int taskId,
  });
}
