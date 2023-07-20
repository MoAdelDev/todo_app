part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final DateTime? dateTime;
  final List<Task> tasks;
  final bool isBottomSheetClosed;

  const HomeState({
    this.isDark = false,
    this.dateTime,
    this.tasks = const [],
    this.isBottomSheetClosed = true,
  });

  HomeState copywith({
    bool? isDark,
    DateTime? dateTime,
    List<Task>? tasks,
    bool? isBottomSheetClosed,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        dateTime: dateTime ?? this.dateTime,
        tasks: tasks ?? this.tasks,
        isBottomSheetClosed: isBottomSheetClosed ?? this.isBottomSheetClosed,
      );
  @override
  List<Object> get props => [
        isDark,
        dateTime ?? DateTime.now(),
        tasks,
        isBottomSheetClosed,
      ];
}
