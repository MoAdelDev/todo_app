import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo/core/components/button.dart';
import 'package:todo/core/components/default_progress_indicator.dart';
import 'package:todo/core/components/text_field.dart';
import 'package:todo/core/services/locator_service.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/enums.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/domain/entities/task.dart';
import 'package:todo/todo/presentation/controller/add_task/add_task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final List<String> titles = const [
    'Title',
    'Note',
  ];
  final List<String> hints = [
    'Enter title here',
    'Enter note here',
  ];

  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final List<String> errorMsgs = [
    'Enter the title of your task',
    'Enter the note of your task',
  ];

  final TextEditingController dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now()).toString());

  final TextEditingController startTimeController =
      TextEditingController(text: DateFormat('h:mm').format(DateTime.now()));
  final TextEditingController endTimeController = TextEditingController(
      text: DateFormat('h:mm')
          .format(DateTime.now().copyWith(minute: DateTime.now().minute + 10)));

  final TextEditingController remindController =
      TextEditingController(text: '5');
  final TextEditingController repeatController =
      TextEditingController(text: 'None');

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
                  child: Form(
                    key: _formKey,
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
                              errorMsg: errorMsgs[index],
                              note: hints[index],
                              controller: controllers[index],
                              widget: index == 2
                                  ? const Icon(Icons.date_range)
                                  : null,
                            ),
                          ),
                        ),
                        DefaultTextField(
                          title: 'Due Date',
                          note: state.dateTime == ''
                              ? DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now())
                                  .toString()
                              : state.dateTime,
                          controller: dateController,
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2030),
                            );

                            if (newDate == null) return;

                            if (context.mounted) {
                              String date = DateFormat('dd/MM/yyyy')
                                  .format(newDate)
                                  .toString();
                              dateController.text = date;
                              context
                                  .read<AddTaskBloc>()
                                  .add(AddTaskChangeDateEvent(date));
                            }
                          },
                          widget: const Icon(Icons.date_range),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultTextField(
                                title: 'Start Time',
                                note: state.startTime == ''
                                    ? DateFormat('h:mm').format(
                                        DateTime.now().copyWith(
                                          minute: DateTime.now().minute + 10,
                                        ),
                                      )
                                    : state.startTime,
                                controller: startTimeController
                                  ..text = state.startTime == ''
                                      ? DateFormat('h:mm').format(
                                          DateTime.now().copyWith(
                                            minute: DateTime.now().minute + 10,
                                          ),
                                        )
                                      : state.startTime,
                                widget: const Icon(Icons.access_alarm),
                                onTap: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (newTime == null) return;
                                  if (context.mounted) {
                                    String time = DateFormat('h:mm').format(
                                        DateTime.now().copyWith(
                                            minute: newTime.minute,
                                            hour: newTime.hour));
                                    startTimeController.text = time;
                                    context
                                        .read<AddTaskBloc>()
                                        .add(AddTaskChangeStartTimeEvent(time));
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: DefaultTextField(
                                title: 'End Time',
                                note: state.endTime == ''
                                    ? DateFormat('h:mm').format(
                                        DateTime.now().copyWith(
                                          minute: DateTime.now().minute + 10,
                                        ),
                                      )
                                    : state.endTime,
                                controller: endTimeController,
                                widget: const Icon(Icons.access_alarm),
                                onTap: () async {
                                  TimeOfDay? newTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (newTime == null) return;
                                  if (context.mounted) {
                                    String time = DateFormat('h:mm').format(
                                        DateTime.now().copyWith(
                                            minute: newTime.minute,
                                            hour: newTime.hour));

                                    endTimeController.text = time;

                                    context
                                        .read<AddTaskBloc>()
                                        .add(AddTaskChangeEndTimeEvent(time));
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        DefaultTextField(
                          title: 'Remind',
                          note: '${state.remind} minutes early',
                          controller: remindController
                            ..text = '${state.remind}',
                          widget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
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
                        ),
                        DefaultTextField(
                          title: 'Repeat',
                          note: state.repeat,
                          controller: repeatController..text = state.repeat,
                          widget: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                              underline: Container(),
                              dropdownColor: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10.0),
                              onChanged: (value) => context
                                  .read<AddTaskBloc>()
                                  .add(AddTaskSelectRepeatEvent(
                                      value.toString())),
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
                                              backgroundColor:
                                                  taskColors[index],
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
                              ConditionalBuilder(
                                condition:
                                    state.taskState != RequestState.loading,
                                builder: (context) => DefaultButton(
                                    lable: 'Create Task',
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        int color = 0;
                                        for (int i = 0;
                                            i < taskColors.length;
                                            i++) {
                                          if (taskColors[i] ==
                                              state.taskColor) {
                                            color = i;
                                          }
                                        }
                                        Task task = Task(
                                          1,
                                          controllers[0].text,
                                          controllers[1].text,
                                          0,
                                          dateController.text,
                                          startTimeController.text,
                                          endTimeController.text,
                                          color,
                                          remindController.text,
                                          repeatController.text,
                                        );
                                        context
                                            .read<AddTaskBloc>()
                                            .add(AddTaskInsertEvent(task));
                                      }
                                    }),
                                fallback: (context) => const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: DefaultSpinKit(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
