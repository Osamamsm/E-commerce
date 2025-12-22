import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/auth/presentation/widgets/email_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();

  late String email, password;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(s.login_welcome_message, style: theme.textTheme.titleLarge),
          Text(s.login_welcome_subtitle, style: theme.textTheme.bodyMedium),
          vGap(40),
          EmailTextField(
            onSaved: (value) {
              email = value!;
            },
          ),
          vGap(20),
          PasswordTextField(
            onSaved: (value) {
              password = value!;
            },
          ),
          vGap(5),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: () {}, child: Text(s.forgot_password)),
          ),
          vGap(5),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                context.push(HomeView.routeName);
              }
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
      ),
    );
  }
}
