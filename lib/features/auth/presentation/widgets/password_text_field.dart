import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_visibility_toggle.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.onSaved});
  final void Function(String?) onSaved;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  void _togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return LabeledAuthTextField(
      label: s.password,
      prefixIcon: Icon(
        Icons.lock,
        color: theme.colorScheme.onSurface.withValues(alpha: .5),
      ),
      onSaved: widget.onSaved,
      hintText: s.password_hint,
      validator: Validators.passwordValidator,
      suffixIcon: PasswordVisibilityToggle(
        onToggle: _togglePasswordVisibility,
        isVisible: isPasswordVisible,
      ),
      obscureText: !isPasswordVisible,
    );
  }
}
