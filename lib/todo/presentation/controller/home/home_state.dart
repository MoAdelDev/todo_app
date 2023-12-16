part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final List<Task> tasks;
  final RequestState tasksState;
  final String tasksError;
  final bool isBottomSheetClosed;

  final RequestState addTaskState;
  final String addTaskMessage;
  final String addTaskError;

  final RequestState updateTaskState;
  final String updateTaskMessage;
  final String updateTaskError;

  final RequestState satisfyTaskState;
  final String satisfyTaskMessage;
  final String satisfyTaskError;

  final RequestState deleteTaskState;
  final String deleteTaskMessage;
  final String deleteTaskError;

  const HomeState({
    this.isDark = false,
    this.tasks = const [],
    this.tasksState = RequestState.loading,
    this.tasksError = '',
    this.isBottomSheetClosed = true,
    this.addTaskState = RequestState.nothing,
    this.addTaskMessage = '',
    this.addTaskError = '',
    this.updateTaskState = RequestState.nothing,
    this.updateTaskMessage = '',
    this.updateTaskError = '',
    this.satisfyTaskState = RequestState.nothing,
    this.satisfyTaskMessage = '',
    this.satisfyTaskError = '',
    this.deleteTaskState = RequestState.nothing,
    this.deleteTaskMessage = '',
    this.deleteTaskError = '',
  });

  HomeState copyWith({
    bool? isDark,
    List<Task>? tasks,
    RequestState? tasksState,
    String? tasksError,
    bool? isBottomSheetClosed,
    RequestState? addTaskState,
    String? addTaskMessage,
    String? addTaskError,
    RequestState? updateTaskState,
    String? updateTaskMessage,
    String? updateTaskError,
    RequestState? satisfyTaskState,
    String? satisfyTaskMessage,
    String? satisfyTaskError,
    RequestState? deleteTaskState,
    String? deleteTaskMessage,
    String? deleteTaskError,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        tasks: tasks ?? this.tasks,
        tasksState: tasksState ?? this.tasksState,
        tasksError: tasksError ?? this.tasksError,
        isBottomSheetClosed: isBottomSheetClosed ?? this.isBottomSheetClosed,
        addTaskState: addTaskState ?? this.addTaskState,
        addTaskMessage: addTaskMessage ?? this.addTaskMessage,
        addTaskError: addTaskError ?? this.addTaskError,
        updateTaskState: updateTaskState ?? this.updateTaskState,
        updateTaskMessage: updateTaskMessage ?? this.updateTaskMessage,
        updateTaskError: updateTaskError ?? this.updateTaskError,
        satisfyTaskState: updateTaskState ?? this.updateTaskState,
        satisfyTaskMessage: updateTaskMessage ?? this.updateTaskMessage,
        satisfyTaskError: updateTaskError ?? this.updateTaskError,
        deleteTaskState: deleteTaskState ?? this.deleteTaskState,
        deleteTaskMessage: deleteTaskMessage ?? this.deleteTaskMessage,
        deleteTaskError: deleteTaskError ?? this.deleteTaskError,
      );

  @override
  List<Object> get props => [
        isDark,
        tasks,
        tasksState,
        tasksError,
        isBottomSheetClosed,
        addTaskState,
        addTaskMessage,
        addTaskError,
        deleteTaskState,
        deleteTaskMessage,
        deleteTaskError,
        updateTaskState,
        updateTaskMessage,
        updateTaskError,
        satisfyTaskState,
        satisfyTaskMessage,
        satisfyTaskError,
      ];
}
