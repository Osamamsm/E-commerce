import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).login_welcome_message,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          S.of(context).login_welcome_subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
