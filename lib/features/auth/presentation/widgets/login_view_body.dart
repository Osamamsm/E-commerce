import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/auth/presentation/widgets/email_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Column(
      children: [
        Text(s.login_welcome_message, style: theme.textTheme.titleLarge),
        Text(s.login_welcome_subtitle, style: theme.textTheme.bodyMedium),
        vGap(40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(s.email, style: theme.textTheme.bodyLarge),
        ),
        vGap(5),
        EmailTextField(),
        vGap(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(s.password, style: theme.textTheme.bodyLarge),
        ),
        vGap(5),
        PasswordTextField(),
        vGap(5),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: () {}, child: Text(s.forgot_password)),
        ),
        vGap(5),
        ElevatedButton(
          onPressed: () {
            context.push(HomeView.routeName);
          },
          child: Text(s.login),
        ),
        Spacer(flex: 1),
        Row(
          mainAxisSize: .min,
          children: [
            Text(s.no_account, style: theme.textTheme.bodyMedium),
            TextButton(onPressed: () {}, child: Text(s.register)),
          ],
        ),
      ],
    );
  }
}