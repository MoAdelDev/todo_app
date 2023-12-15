import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';

class AddDateBarWidget extends StatelessWidget {
  const AddDateBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(const Duration(days: 4)),
              DateTime.now().add(const Duration(days: 3))),
          onSelectionChanged: (selectedDate) {
            if (selectedDate.value is DateTime) {
              context
                  .read<HomeBloc>()
                  .add(HomeChangeDateTimeEvent(selectedDate.value));
            }
          },
        );
      },
    );
  }
}
