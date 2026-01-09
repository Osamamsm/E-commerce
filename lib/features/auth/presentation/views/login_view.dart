import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_state.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login-view';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInFailure) {
          showCustomDialog(
            context: context,
            message: state.errMessage,
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgress(
          isLoading: state is LogInLoading,
          child: CustomScaffold(child: const LoginViewBody()),
        );
      },
    );
  }
}
