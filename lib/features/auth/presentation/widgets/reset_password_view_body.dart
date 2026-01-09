import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/auth/presentation/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              vGap(30),
              PasswordTextField(
                passwordController: passwordController,
                validator: Validators.passwordValidator,
                hintText: s.enter_new_password_hint,
                label: s.new_password,
                onSaved: (value) {
                  password = value!;
                },
              ),
              vGap(20),
              PasswordTextField(
                label: s.confirm_password,
                hintText: s.confirm_new_password_hint,
                onSaved: (value) {
                  confirmPassword = value!;
                },
                validator: (value) {
                  return Validators.confirmPasswordValidator(
                    value,
                    passwordController.text,
                  );
                },
              ),
              vGap(20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<ResetPasswordCubit>().resetPassword(password);
                  }
                },
                child: Text(S.of(context).confirm),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
