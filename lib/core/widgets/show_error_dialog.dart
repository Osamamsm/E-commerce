import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

void showCustomDialog({required BuildContext context, required String message,required DialogType dialogType, Function()? onOkPressed}) {
  if (context.mounted) {
    AwesomeDialog(
      dialogBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
      headerAnimationLoop: false,
      context: context,
      dialogType: dialogType,
      body: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: .center,
      ),
      btnOkText: S.of(context).ok,
      btnOkOnPress: onOkPressed,
      btnOkColor: Theme.of(context).colorScheme.primary,
    ).show();
  }
}
