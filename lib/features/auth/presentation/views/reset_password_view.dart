import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/auth/presentation/widgets/reset_password_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  static String routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).reset_password,
      child: const ResetPasswordViewBody(),
    );
  }
}
