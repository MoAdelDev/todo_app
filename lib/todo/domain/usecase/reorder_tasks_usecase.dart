import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class ReorderTasksUseCase {
  final TodoBaseRepository todoBaseRepository;

  ReorderTasksUseCase(this.todoBaseRepository);

  Future<Either<Failure, List<Task>>> call({required int oldIndex, required int newIndex}) async =>
      await todoBaseRepository.reorderTasks(oldIndex: oldIndex, newIndex: newIndex);
}
