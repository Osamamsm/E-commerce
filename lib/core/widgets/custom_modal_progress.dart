import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModalProgress extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomModalProgress({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: Theme.of(context).colorScheme.surface,
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: child,
    );
  }
}