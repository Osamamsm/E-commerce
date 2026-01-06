import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message) {
  if (context.mounted) {
    AwesomeDialog(
      dialogBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
      headerAnimationLoop: false,
      context: context,
      dialogType: DialogType.error,
      body: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: .center,
      ),
      btnOkText: S.of(context).ok,
      btnOkOnPress: () {},
      btnOkColor: Theme.of(context).colorScheme.primary,
    ).show();
  }
}
