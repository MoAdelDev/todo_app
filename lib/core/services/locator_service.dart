import 'package:get_it/get_it.dart';
import 'package:todo/todo/presentation/controller/add_task/add_task_bloc.dart';

class LocatorService {
  static final GetIt ls = GetIt.instance;

  void init() {
    ls.registerFactory<AddTaskBloc>(() => AddTaskBloc());
  }
}
