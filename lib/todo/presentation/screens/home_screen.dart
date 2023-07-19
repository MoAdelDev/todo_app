import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/services/notification_service.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/widgets/add_date_bar_widget.dart';
import 'package:todo/todo/presentation/widgets/add_task_bar_widget.dart';
import 'package:todo/todo/presentation/widgets/tasks_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotificationsService notificationsService;
  @override
  void initState() {
    super.initState();
    notificationsService = NotificationsService();
    notificationsService.init();
    notificationsService.requestIosPermision();
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
                context.read<HomeBloc>().add(HomeChnageThemeModeEvent());
                notificationsService.displayNotification(
                    title: 'Hello World', body: 'Hello');
                notificationsService.scheduledNotification(
                    title: 'Hello World', body: 'Hello');
              },
              icon: Icon(
                MyApp.isDark
                    ? Icons.wb_sunny_outlined
                    : Icons.nightlight_round_outlined,
                color: MyApp.isDark ? Colors.white : AppColor.darkGreyColor,
              ),
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
                  AddDateBarWidget(),
                  SizedBox(
                    height: 8.0,
                  ),
                  Expanded(child: TasksWidget()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
