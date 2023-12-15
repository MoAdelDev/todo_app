import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/services/database_helper.dart';
import 'package:todo/core/services/locator_service.dart';
import 'package:todo/core/services/cache_helper.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();

  LocatorService().init();
  await CacheHelper.init();
  //await NotificationsService().init();
  await DatabaseHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LocatorService.ls<HomeBloc>()..add(HomeGetTasksEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.light,
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: Themes.dark,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
