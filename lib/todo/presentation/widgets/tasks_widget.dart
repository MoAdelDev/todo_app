import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quickalert/quickalert.dart';
import 'package:todo/core/components/default_progress_indicator.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/widgets/task_tile.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.tasksState == RequestState.success,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Task task = state.tasks[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1500),
                child: FadeInAnimation(
                  child: Dismissible(
                    key: Key('${task.id}'),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: Theme.of(context).colorScheme.error,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Delete this task',
                            style: Themes.titleStyle.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          )),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        // Delete this task
                        Color color = LightColor.primaryColor;
                        if (task.color == 0)
                          color = LightColor.primaryColor;
                        else if (task.color == 1)
                          color = Colors.red;
                        else
                          color = LightColor.secondaryColor;

                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            title: 'Delete the task',
                            borderRadius: 30.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            barrierDismissible: true,
                            animType: QuickAlertAnimType.rotate,
                            cancelBtnText: 'Cancel',
                            onConfirmBtnTap: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(HomeDeleteTaskEvent(task.id));
                              Navigator.pop(context);
                            },
                            text: 'Are you want to delete this task',
                            textColor:
                                Theme.of(context).colorScheme.onBackground,
                            confirmBtnText: 'Delete',
                            confirmBtnTextStyle: Themes.subTitleStyle.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                            cancelBtnTextStyle: Themes.subTitleStyle.copyWith(
                                color: Theme.of(context).colorScheme.onError),
                            confirmBtnColor:
                                Theme.of(context).colorScheme.primary,
                            onCancelBtnTap: () {
                              Navigator.pop(context);
                            });
                        return false;
                      }
                      return false;
                    },
                    child: TaskTile(task: task),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemCount: state.tasks.length,
          ),
          fallback: (context) => const Center(
            child: DefaultSpinKit(),
          ),
        );
      },
    );
  }
}
