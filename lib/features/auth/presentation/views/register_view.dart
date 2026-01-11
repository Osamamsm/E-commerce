import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_state.dart';
import 'package:e_commerce/features/auth/presentation/widgets/register_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static String routeName = '/register-view';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showCustomDialog(
            context: context,
            message: state.errMessage,
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
        if (state is SignUpSuccess) {
          showCustomDialog(
            context: context,
            message: S.of(context).sign_up_success_message,
            dialogType: DialogType.success,
            onOkPressed: () {
              GoRouter.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgress(
          isLoading: state is SignUpLoading,
          child: CustomScaffold(
            title: S.of(context).create_account,
            child: const RegisterViewBody(),
          ),
        );
      },
    );
  }
}
