import 'package:get_it/get_it.dart';
import 'package:todo/todo/data/datasource/todo_datasource.dart';
import 'package:todo/todo/data/repository/todo_repository.dart';
import 'package:todo/todo/domain/repository/todo_base_repository.dart';
import 'package:todo/todo/domain/usecase/insert_task_usecase.dart';
import 'package:todo/todo/presentation/controller/add_task/add_task_bloc.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';

class LocatorService {
  static final GetIt ls = GetIt.instance;

  void init() {
    // BloC
    ls.registerFactory<AddTaskBloc>(() => AddTaskBloc(ls()));
    ls.registerFactory<HomeBloc>(() => HomeBloc());

    // Data source
    ls.registerLazySingleton<TodoBaseDataSource>(() => TodoDataSource());

    // Repository
    ls.registerLazySingleton<TodoBaseRepository>(() => TodoRepository(ls()));

    // use case
    ls.registerLazySingleton<InsertTaskUseCase>(() => InsertTaskUseCase(ls()));
  }
}
