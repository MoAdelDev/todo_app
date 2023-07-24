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
      ];
}
