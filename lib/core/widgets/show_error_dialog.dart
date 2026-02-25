import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  required String message,
  required DialogType dialogType,
  Function()? onOkPressed,
  // New optional params for two-choice dialog
  bool showCancelBtn = false,
  String? cancelBtnText,
  String? okBtnText,
  Function()? onCancelPressed,
}) {
  if (context.mounted) {
    AwesomeDialog(
      dialogBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
      headerAnimationLoop: false,
      context: context,
      dialogType: dialogType,
      body: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      btnOkText: okBtnText ?? S.of(context).ok,
      btnOkOnPress: onOkPressed,
      btnOkColor: Theme.of(context).colorScheme.primary,
      // Only show cancel button when needed
      btnCancelText: showCancelBtn ? (cancelBtnText ?? S.of(context).cancel) : null,
      btnCancelOnPress: showCancelBtn ? (onCancelPressed ?? () {}) : null,
      btnCancelColor: showCancelBtn ? Theme.of(context).colorScheme.error : null,
    ).show();
  }
}