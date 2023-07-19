part of 'home_bloc.dart';

class HomeState extends Equatable {
  final bool isDark;
  const HomeState({this.isDark = false});

  HomeState copywith({bool? isDark}) =>
      HomeState(isDark: isDark ?? this.isDark);
  @override
  List<Object> get props => [
        isDark,
      ];
}
