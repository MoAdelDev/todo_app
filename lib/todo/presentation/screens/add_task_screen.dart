import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/components/button.dart';
import 'package:todo/core/components/text_field.dart';
import 'package:todo/core/services/locator_service.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:intl/intl.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/presentation/controller/add_task/add_task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  final List<String> titles = const ['Title', 'Note', 'Date'];
  final List<String> hints = [
    'Enter title here',
    'Enter note here',
    DateFormat('dd/MM/yyyy').format(DateTime.now()).toString(),
  ];

  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final TextEditingController remindController = TextEditingController();
  final TextEditingController repeatController = TextEditingController();

  final List<int> reminds = [5, 10, 15, 50, 25];
  final List<String> repeats = ['None', 'Daily', 'Weekly', 'Monthly'];

  final List<Color> taskColors = [
    AppColor.bluishColor,
    Colors.red,
    AppColor.orangeColor,
  ];

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: MyApp.isDark ? Colors.white : AppColor.darkGreyColor,
          ),
        ),
      ),
      backgroundColor: context.theme.colorScheme.background,
      body: BlocProvider<AddTaskBloc>(
        create: (context) => LocatorService.ls(),
        child: BlocBuilder<AddTaskBloc, AddTaskState>(
          builder: (context, state) {
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 14.0, left: 14.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Add Task',
                        style: Themes.headingStyle,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Wrap(
                        children: List<Widget>.generate(
                          titles.length,
                          (index) => DefaultTextField(
                            title: titles[index],
                            note: hints[index],
                            controller: controllers[index],
                            widget: index == 2
                                ? const Icon(Icons.date_range)
                                : null,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: DefaultTextField(
                              title: 'Start Time',
                              note: DateFormat('h:mm').format(DateTime.now()),
                              controller: startTimeController,
                              widget: const Icon(Icons.access_alarm),
                            ),
                          ),
                          Expanded(
                            child: DefaultTextField(
                              title: 'End Time',
                              note: DateFormat('h:mm').format(
                                  DateTime.fromMillisecondsSinceEpoch(10000)),
                              controller: startTimeController,
                              widget: const Icon(Icons.access_alarm),
                            ),
                          ),
                        ],
                      ),
                      DefaultTextField(
                        title: 'Remind',
                        note: '${state.remind} minutes early',
                        controller: remindController,
                        widget: DropdownButton(
                          underline: Container(),
                          dropdownColor: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10.0),
                          onChanged: (value) => context
                              .read<AddTaskBloc>()
                              .add(AddTaskSelectRemindEvent(value ?? 0)),
                          items: reminds
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    '$e',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      DefaultTextField(
                        title: 'Repeat',
                        note: state.repeat,
                        controller: repeatController,
                        widget: DropdownButton(
                          dropdownColor: Colors.blueGrey,
                          underline: Container(),
                          borderRadius: BorderRadius.circular(10.0),
                          onChanged: (value) => context
                              .read<AddTaskBloc>()
                              .add(AddTaskSelectRepeatEvent(value ?? '')),
                          items: repeats
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Color',
                                  style: Themes.titleStyle,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  children: List<Widget>.generate(
                                    taskColors.length,
                                    (index) => Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            context.read<AddTaskBloc>().add(
                                                AddTaskSelectColorEvent(
                                                    taskColors[index]));
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: taskColors[index],
                                            radius: 15.0,
                                            child: state.taskColor ==
                                                    taskColors[index]
                                                ? const Align(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    child: Icon(
                                                      Icons.check,
                                                      color:
                                                          AppColor.whiteColor,
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            DefaultButton(lable: 'Create Task', onTap: () {})
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
