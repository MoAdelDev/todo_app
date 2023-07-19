import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/components/button.dart';
import 'package:todo/core/components/text_field.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:todo/todo/presentation/screens/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('aaaa');
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () async {
                context.read<HomeBloc>().add(HomeChnageThemeModeEvent());
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
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultButton(
                  onTap: () {
                    Get.to(AddTaskScreen());
                  },
                  lable: 'Add task',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DefaultTextField(
                  title: 'Task',
                  note: 'This is note',
                  controller: TextEditingController(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
