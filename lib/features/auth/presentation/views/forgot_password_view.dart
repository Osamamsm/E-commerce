import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_state.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/widgets/forgot_password_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static const String routeName = '/forgot-password-view';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is RequestPasswordResetSuccess) {
          showCustomDialog(
            context: context,
            message: S.of(context).check_email_for_reset_link_message,
            dialogType: DialogType.info,
            onOkPressed: () {
              GoRouter.of(context).go(LoginView.routeName);
            },
          );
        }
        if (state is RequestPasswordResetFailure) {
          showCustomDialog(
            context: context,
            message: state.message,
            dialogType: DialogType.error,
          );
        }
      },
      builder: (context, state) => CustomModalProgress(
        isLoading: state is RequestPasswordResetLoading,
        child: CustomScaffold(
          title: S.of(context).forgot_password,
          child: ForgotPasswordViewBody(),
        ),
      ),
    );
  }
}
