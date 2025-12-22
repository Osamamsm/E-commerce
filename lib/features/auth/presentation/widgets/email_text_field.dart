import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return AuthTextField(
      prefixIcon: Icon(
        Icons.email,
        color: theme.colorScheme.onSurface.withValues(alpha: .5),
      ),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {},
      hintText: s.email_hint,
      validator: Validators.emailValidator,
    );
  }
}
