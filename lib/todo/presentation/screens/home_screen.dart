import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/widgets/date_bar_widget.dart';
import 'package:todo/todo/presentation/widgets/add_task_bar_widget.dart';
import 'package:todo/todo/presentation/widgets/tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () async {
                context.read<HomeBloc>().add(HomeChangeThemeModeEvent());
              },
              icon: Icon(
                  MyApp.isDark
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round_outlined,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            actions: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/person.jpeg'),
                radius: 20.0,
              ),
              SizedBox(
                width: 20.0,
              )
            ],
          ),
          body: const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  AddTaskBarWidget(),
                  SizedBox(
                    height: 8.0,
                  ),
                  DateBarWidget(),
                  SizedBox(
                    height: 8.0,
                  ),
                  Expanded(
                    child: TasksWidget(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
