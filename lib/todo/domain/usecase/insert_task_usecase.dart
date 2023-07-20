import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class InsertTaskUseCase {
  final TodoBaseRepository todoBaseRepository;

  InsertTaskUseCase(this.todoBaseRepository);

  Future<Either<Failure, String>> call({required Task task}) async =>
      await todoBaseRepository.insretTask(task: task);
}
