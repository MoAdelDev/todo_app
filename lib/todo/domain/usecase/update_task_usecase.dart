import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class UpdateTaskUseCase {
  final TodoBaseRepository todoBaseRepository;

  UpdateTaskUseCase(this.todoBaseRepository);

  Future<Either<Failure, String>> call({required Task task, required int taskId}) async =>
      await todoBaseRepository.updateTask(task: task, taskId: taskId);
}
