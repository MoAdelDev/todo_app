part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  final DateTime? dateTime;
  const HomeState({this.isDark = false, this.dateTime});

  HomeState copywith({
    bool? isDark,
    DateTime? dateTime,
  }) =>
      HomeState(
        isDark: isDark ?? this.isDark,
        dateTime: dateTime ?? this.dateTime,
      );
  @override
  List<Object> get props => [
        isDark,
        dateTime ?? DateTime.now(),
      ];
}
