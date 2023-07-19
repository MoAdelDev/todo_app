import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/components/button.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/screens/add_task_screen.dart';

class AddTaskBarWidget extends StatelessWidget {
  const AddTaskBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd().format(DateTime.now()),
                  style: Themes.subHeadingStyle,
                ),
                Text(
                  'Today',
                  style: Themes.headingStyle,
                ),
              ],
            ),
            const Spacer(),
            DefaultButton(
                lable: 'Add Task',
                onTap: () async {
                  await Get.to(AddTaskScreen());
                })
          ],
        );
      },
    );
  }
}
