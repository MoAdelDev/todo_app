part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final DateTime? dateTime;
  final List<Task> tasks;
  final RequestState tasksState;
  final String tasksError;
  final bool isBottomSheetClosed;

  final RequestState addTaskState;
  final String addTaskMessage;
  final String addTaskError;

  final RequestState deleteTaskState;
  final String deleteTaskMessage;
  final String deleteTaskError;

  const HomeState({
    this.isDark = false,
    this.dateTime,
    this.tasks = const [],
    this.tasksState = RequestState.loading,
    this.tasksError = '',
    this.isBottomSheetClosed = true,
    this.addTaskState = RequestState.nothing,
    this.addTaskMessage = '',
    this.addTaskError = '',
    this.deleteTaskState = RequestState.nothing,
    this.deleteTaskMessage = '',
    this.deleteTaskError = '',
  });

  HomeState copyWith({
    bool? isDark,
    DateTime? dateTime,
    List<Task>? tasks,
    RequestState? tasksState,
    String? tasksError,
    bool? isBottomSheetClosed,
    RequestState? addTaskState,
    String? addTaskMessage,
    String? addTaskError,
    RequestState? deleteTaskState,
    String? deleteTaskMessage,
    String? deleteTaskError,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        dateTime: dateTime ?? this.dateTime,
        tasks: tasks ?? this.tasks,
        tasksState: tasksState ?? this.tasksState,
        tasksError: tasksError ?? this.tasksError,
        isBottomSheetClosed: isBottomSheetClosed ?? this.isBottomSheetClosed,
        addTaskState: addTaskState ?? this.addTaskState,
        addTaskMessage: addTaskMessage ?? this.addTaskMessage,
        addTaskError: addTaskError ?? this.addTaskError,
        deleteTaskState: deleteTaskState ?? this.deleteTaskState,
        deleteTaskMessage: deleteTaskMessage ?? this.deleteTaskMessage,
        deleteTaskError: deleteTaskError ?? this.deleteTaskError,
      );

  @override
  List<Object> get props => [
        isDark,
        dateTime ?? DateTime.now(),
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
      ];
}
