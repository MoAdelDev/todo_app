import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/services/cache_service.dart';
import 'package:todo/main.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeBaseEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeBaseEvent>(_changeThemeMode);
  }

  FutureOr<void> _changeThemeMode(
      HomeBaseEvent event, Emitter<HomeState> emit) {
    MyApp.isDark = !MyApp.isDark;
    CacheService.saveData(key: 'isDark', value: MyApp.isDark);
    emit(state.copywith(isDark: !state.isDark));
  }
}
