import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:todo/core/style/themes.dart';

class AppDialog {
  static showConformDialog({
    required BuildContext context,
    required String title,
    required String body,
    required confirmBtnText,
    required VoidCallback onConfirmTab,
  }) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        title: title,
        borderRadius: 30.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        barrierDismissible: true,
        animType: QuickAlertAnimType.rotate,
        cancelBtnText: 'Cancel',
        onConfirmBtnTap: onConfirmTab,
        text: body,
        textColor: Theme.of(context).colorScheme.onBackground,
        confirmBtnText: confirmBtnText,
        confirmBtnTextStyle: Themes.subTitleStyle
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        cancelBtnTextStyle: Themes.subTitleStyle
            .copyWith(color: Theme.of(context).colorScheme.onError),
        confirmBtnColor: Theme.of(context).colorScheme.primary,
        onCancelBtnTap: () {
          Navigator.pop(context);
        });
  }
}
