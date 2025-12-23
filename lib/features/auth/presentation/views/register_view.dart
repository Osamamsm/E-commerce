import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/auth/presentation/widgets/register_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static String routeName = '/register-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).create_account,
      child: const RegisterViewBody(),
    );
  }
}
