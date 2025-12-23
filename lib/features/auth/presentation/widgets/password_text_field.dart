import 'package:e_commerce/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_visibility_toggle.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.onSaved,
    required this.validator,
    required this.hintText,
    required this.label,
    this.passwordController,
  });
  final void Function(String?) onSaved;
  final String? Function(String?) validator;
  final String hintText;
  final String label;
  final TextEditingController? passwordController;
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
    return LabeledAuthTextField(
      controller: widget.passwordController,
      label: widget.label,
      prefixIcon: Icon(
        Icons.lock,
        color: theme.colorScheme.onSurface.withValues(alpha: .5),
      ),
      onSaved: widget.onSaved,
      hintText: widget.hintText,
      validator: widget.validator,
      suffixIcon: PasswordVisibilityToggle(
        onToggle: _togglePasswordVisibility,
        isVisible: isPasswordVisible,
      ),
      obscureText: !isPasswordVisible,
    );
  }
}
