import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/auth/presentation/logic/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_state.dart';
import 'package:e_commerce/features/auth/presentation/widgets/reset_password_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  static String routeName = '/reset-password';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          showCustomDialog(
            context: context,
            message: S.of(context).reset_password_success_message,
            dialogType: DialogType.success,
            onOkPressed: () {
              context.read<AuthCubit>().clearRecoveryFlow();
            },
          );
        }
        if (state is ResetPasswordFailure) {
          showCustomDialog(
            context: context,
            message: state.message,
            dialogType: DialogType.error,
            onOkPressed: () {
              null;
            },
          );
        }
      },
      builder: (context, state) => CustomModalProgress(
        isLoading: state is ResetPasswordLoading,
        child: CustomScaffold(
          title: S.of(context).reset_password,
          child: ResetPasswordViewBody(),
        ),
      ),
    );
  }
}
