import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class DeleteTaskUseCase {
  final TodoBaseRepository todoBaseRepository;

  DeleteTaskUseCase(this.todoBaseRepository);

  Future<Either<Failure, String>> call({required int taskId}) async =>
      await todoBaseRepository.deleteTask(taskId: taskId);
}
