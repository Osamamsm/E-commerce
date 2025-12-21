import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(child: const LoginViewBody());
  }
}
