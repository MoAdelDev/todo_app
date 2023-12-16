import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class SatisfyTaskUseCase {
  final TodoBaseRepository todoBaseRepository;

  SatisfyTaskUseCase(this.todoBaseRepository);

  Future<Either<Failure, void>> call(
          {required int taskId, required int isCompleted}) async =>
      await todoBaseRepository.satisfyTask(
          taskId: taskId, isCompleted: isCompleted);
}
