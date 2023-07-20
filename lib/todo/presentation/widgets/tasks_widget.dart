import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo/core/services/notification_service.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/widgets/task_tile.dart';

class TasksWidget extends StatelessWidget {
  final NotificationsService notificationsService;
  const TasksWidget({
    super.key,
    required this.notificationsService,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var task = state.tasks[index];

            notificationsService.scheduledNotification(
              int.parse(task.startTime.toString().split(':')[0]),
              int.parse(task.startTime.toString().split(':')[1]),
              task,
            );
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1500),
              child: FadeInAnimation(
                child: TaskTile(task: state.tasks[index]),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10.0,
          ),
          itemCount: state.tasks.length,
        );
      },
    );
  }
}
