import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo/core/components/default_progress_indicator.dart';
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
                  child: TaskTile(task: task),
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
