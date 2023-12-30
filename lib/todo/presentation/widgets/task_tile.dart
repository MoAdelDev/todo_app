import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/presentation/screens/add_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(AddTaskScreen(
          task: task,
        ));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: Row(
              children: [
                const Icon(Icons.drag_indicator_sharp, color: Colors.white,),
                const Gap(8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: Themes.titleStyle.copyWith(color: Colors.white),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 18.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            task.dueDate,
                            style: Themes.bodyStyle
                                .copyWith(color: Colors.grey[200]),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '${task.startTime} - ${task.endTime}',
                            style: Themes.bodyStyle
                                .copyWith(color: Colors.grey[200]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        task.note,
                        style:
                            Themes.subTitleStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: 0.5,
                    color: Colors.grey[200]?.withOpacity(0.7),
                    height: 100,
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      task.isCompleted == 1 ? 'Completed' : 'TODO',
                      style: Themes.titleStyle.copyWith(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
