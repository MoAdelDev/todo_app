import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:todo/core/components/default_progress_indicator.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/core/utils/dialogs.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/widgets/task_tile.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({
    super.key,
  });

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {

  Color taskBackgroundColor = LightColor.primaryColor;

  bool isDraggableMode = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        return ConditionalBuilder(
          condition: state.tasksState == RequestState.success,
          builder: (context) {
            if (state.tasks.isNotEmpty)
              return ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  if(state.tasks[oldIndex].isCompleted == 0 && state.tasks[newIndex].isCompleted == 0){
                    setState(() {
                      if (newIndex > state.tasks.length) newIndex = state.tasks.length;
                      if (oldIndex < newIndex) newIndex--;
                    });
                    context
                        .read<HomeBloc>()
                        .add(HomeReorderTasksEvent(oldIndex, newIndex));
                  }
                },
                onReorderStart: (index) {
                  setState(() {
                    taskBackgroundColor = taskBackgroundColor.withOpacity(0.6);
                    isDraggableMode = true;
                  });
                },
                onReorderEnd: (index){
                  setState(() {
                    taskBackgroundColor = taskBackgroundColor.withOpacity(1);
                    isDraggableMode = false;
                  });
                },
                children: List.generate(state.tasks.length, (index) {
                  Task task = state.tasks[index];
                   if(!isDraggableMode){
                     taskBackgroundColor = LightColor.primaryColor;
                     if (task.color == 0)
                       taskBackgroundColor = LightColor.primaryColor;
                     else if (task.color == 1)
                       taskBackgroundColor = Colors.red;
                     else
                       taskBackgroundColor = LightColor.secondaryColor;

                   }
                  return  AnimationConfiguration.staggeredList(
                    key: ValueKey(index),
                    position: state.tasks.indexOf(task),
                    duration: const Duration(milliseconds: 1500),
                    child: FadeInAnimation(
                      child: Dismissible(
                        key: Key('${task.id}'),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Delete this task',
                                style: Themes.titleStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )),
                        ),
                        secondaryBackground: Container(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                task.isCompleted == 0
                                    ? 'Complete the task'
                                    : 'Abandon the task',
                                style: Themes.titleStyle.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                              )),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            // Delete this task
                            AppDialog.showConformDialog(
                                context: context,
                                title: 'Delete the task',
                                body: 'Are you want to delete this task',
                                confirmBtnText: 'Delete',
                                onConfirmTab: () {
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(HomeDeleteTaskEvent(task.id));
                                  Navigator.pop(context);
                                });
                          } else if (direction ==
                              DismissDirection.endToStart) {
                            // Complete this task
                            AppDialog.showConformDialog(
                                context: context,
                                title: task.isCompleted == 0
                                    ? 'Complete the task'
                                    : 'Abandon the task',
                                body: task.isCompleted == 0
                                    ? 'Are you want to complete this task'
                                    : 'Are you want to abandon this task',
                                confirmBtnText: task.isCompleted == 0
                                    ? 'Complete'
                                    : 'Abandon',
                                onConfirmTab: () {
                                  // Confirm to complete task
                                  BlocProvider.of<HomeBloc>(context).add(
                                    HomeSatisfyTaskEvent(task.id,
                                        task.isCompleted == 0 ? 1 : 0),
                                  );
                                  Navigator.pop(context);
                                });
                          }
                          return false;
                        },
                        child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: task.isCompleted==0 ? taskBackgroundColor : Colors.grey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            margin: const EdgeInsets.all(5.0),
                            child: TaskTile(task: task)),
                      ),
                    ),
                  );
                }),
              );
           return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/splash.png',
                  width: 100,
                  height: 100,
                ),
                const Gap(20),
                Text(
                  "You don't have any tasks",
                  style: Themes.titleStyle,
                ),
              ],
            );
          },
          fallback: (context) => const Center(
            child: DefaultSpinKit(),
          ),
        );
      },
    );
  }
}
