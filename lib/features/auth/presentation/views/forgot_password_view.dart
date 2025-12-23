import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/auth/presentation/widgets/forgot_password_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static const String routeName = '/forgot-password-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).forgot_password,
      child:ForgotPasswordViewBody(),
    );
  }
}