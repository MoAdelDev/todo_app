import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';

abstract class TodoBaseRepository {
  Future<Either<Failure, String>> insretTask({
    required Task task,
  });
}
