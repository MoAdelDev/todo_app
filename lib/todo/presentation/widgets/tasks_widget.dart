import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/style/colors.dart';
import 'package:todo/core/style/themes.dart';
import 'package:todo/main.dart';
import 'package:todo/todo/presentation/controller/home/home_bloc.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.tasks.isEmpty) {
          return Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 2000),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: MediaQuery.orientationOf(context) ==
                            Orientation.landscape
                        ? Axis.horizontal
                        : Axis.vertical,
                    children: [
                      SvgPicture.asset(
                        'assets/images/task.svg',
                        // ignore: deprecated_member_use
                        color: MyApp.isDark
                            ? AppColor.primaryColor.withAlpha(60)
                            : AppColor.primaryColor.withOpacity(0.5),
                        width: 120.0,
                        height: 120.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'No tasks yet',
                            textStyle: Themes.headingStyle.copyWith(
                              fontSize: 30,
                            ),
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.secondary,
                              Theme.of(context).colorScheme.secondaryContainer,
                              Theme.of(context).colorScheme.error,
                            ],
                          ),
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
