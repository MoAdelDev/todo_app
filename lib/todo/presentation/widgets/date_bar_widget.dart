import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DateBarWidget extends StatelessWidget {
  const DateBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          dayTextStyle: Themes.bodyStyle,
          selectionColor: LightColor.primaryColor,
          selectedTextColor: Colors.white,
          dateTextStyle: Themes.titleStyle,
          monthTextStyle: Themes.bodyStyle,
          height: 100,
          width: 70,
          onDateChange: (selectedDate) {
            context.read<HomeBloc>().add(HomeSearchTasksEvent(selectedDate));
          },
        );
      },
    );
  }
}
