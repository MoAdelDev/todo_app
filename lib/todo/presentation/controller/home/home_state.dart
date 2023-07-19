part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final DateTime? dateTime;
  final List<Task> tasks;
  const HomeState({this.isDark = false, this.dateTime, this.tasks = const []});

  HomeState copywith({
    bool? isDark,
    DateTime? dateTime,
    List<Task>? tasks,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        dateTime: dateTime ?? this.dateTime,
        tasks: tasks ?? this.tasks,
      );
  @override
  List<Object> get props => [
        isDark,
        dateTime ?? DateTime.now(),
        tasks,
      ];
}
