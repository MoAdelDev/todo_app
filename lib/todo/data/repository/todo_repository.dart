import 'package:either_dart/either.dart';
import 'package:todo/core/error/exception.dart';
import 'package:todo/core/error/failure.dart';
import 'package:todo/todo/data/datasource/todo_datasource.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';

class TodoRepository extends TodoBaseRepository {
  final TodoBaseDataSource todoBaseDataSource;

  TodoRepository(this.todoBaseDataSource);

  @override
  Future<Either<Failure, String>> insertTask({required Task task}) async {
    try {
      final result = await todoBaseDataSource.insertTask(task: task);
      return Right(result);
    } on ServerException catch (e) {
      return Left(LocalFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final result = await todoBaseDataSource.getTasks();
      return Right(result);
    } on ServerException catch (e) {
      return Left(LocalFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> deleteTask({required int taskId}) async{
    try {
      final result = await todoBaseDataSource.deleteTask(taskId: taskId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(LocalFailure(e.errorMessageModel.errorMessage));
    }
  }
}
