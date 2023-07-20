part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final DateTime? dateTime;
  final List<Task> tasks;
  final RequestState tasksState;
  final String tasksError;
  final bool isBottomSheetClosed;

  const HomeState({
    this.isDark = false,
    this.dateTime,
    this.tasks = const [],
    this.tasksState = RequestState.loading,
    this.tasksError = '',
    this.isBottomSheetClosed = true,
  });

  HomeState copywith({
    bool? isDark,
    DateTime? dateTime,
    List<Task>? tasks,
    RequestState? tasksState,
    String? tasksError,
    bool? isBottomSheetClosed,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        dateTime: dateTime ?? this.dateTime,
        tasks: tasks ?? this.tasks,
        tasksState: tasksState ?? this.tasksState,
        tasksError: tasksError ?? this.tasksError,
        isBottomSheetClosed: isBottomSheetClosed ?? this.isBottomSheetClosed,
      );
  @override
  List<Object> get props => [
        isDark,
        dateTime ?? DateTime.now(),
        tasks,
        tasksState,
        tasksError,
        isBottomSheetClosed,
      ];
}
