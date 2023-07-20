import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class GetTasksUseCase {
  final TodoBaseRepository todoBaseRepository;

  GetTasksUseCase(this.todoBaseRepository);

  Future<Either<Failure, List<Task>>> call() async =>
      await todoBaseRepository.getTasks();
}
