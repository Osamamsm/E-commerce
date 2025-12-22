import 'package:flutter/material.dart';

class PasswordVisibilityToggle extends StatelessWidget {
  const PasswordVisibilityToggle({super.key, required this.onToggle, required this.isVisible});

  final VoidCallback onToggle;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 50,
      child: Row(
        mainAxisSize: .min,
        children: [
          Container(
            width: 1,
            height: 50,
            color: theme.colorScheme.onSurface.withValues(alpha: .25),
          ),
          IconButton(
            onPressed: onToggle,
            icon: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: theme.colorScheme.onSurface.withValues(alpha: .5),
            ),
            splashRadius: 10,
          ),
        ],
      ),
    );
  }
}
