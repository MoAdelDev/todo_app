import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/core/style/colors.dart';

import '../../../core/style/themes.dart';
import '../../../main.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction:
                  MediaQuery.orientationOf(context) == Orientation.landscape
                      ? Axis.horizontal
                      : Axis.vertical,
              children: [
                SvgPicture.asset(
                  'assets/images/task.svg',
                  // ignore: deprecated_member_use
                  color: MyApp.isDark
                      ? LightColor.primaryColor.withAlpha(60)
                      : LightColor.primaryColor.withOpacity(0.5),
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
}
