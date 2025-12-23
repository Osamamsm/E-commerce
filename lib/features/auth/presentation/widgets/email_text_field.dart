import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.onSaved});

  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return LabeledAuthTextField(
      label: s.email,
      prefixIcon: Icon(
        Icons.email,
        color: theme.colorScheme.onSurface.withValues(alpha: .5),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
      hintText: s.email_hint,
      validator: Validators.emailValidator,
    );
  }
}
