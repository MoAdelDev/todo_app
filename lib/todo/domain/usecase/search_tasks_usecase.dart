import 'package:either_dart/either.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class SearchTasksUseCase {
  final TodoBaseRepository todoBaseRepository;

  const SearchTasksUseCase(this.todoBaseRepository);

  Future<Either<Failure, List<Task>>> call({required String dateTime}) async =>
      await todoBaseRepository.searchTasks(dateTime: dateTime);
}
