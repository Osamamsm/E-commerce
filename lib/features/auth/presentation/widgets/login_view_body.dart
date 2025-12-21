import 'package:e_commerce/core/helpers/spacing.dart';
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
        TextField(decoration: InputDecoration(hintText: s.email_hint)),
        vGap(10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(s.password, style: theme.textTheme.bodyLarge),
        ),
        vGap(10),
        TextField(
          decoration: InputDecoration(
            hintText: s.password_hint,
            suffixIcon: SizedBox(
              width: 50,
              child: Row(
                mainAxisSize: .min,
                children: [
                  Container(
                    width: 1,
                    height: 50,
                    color: theme.colorScheme.onSurface.withValues(alpha: .25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off,
                      size: 20,
                      color: theme.colorScheme.onSurface.withValues(alpha: .5),
                    ),
                    splashRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
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
