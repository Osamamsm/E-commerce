import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.enabled,
  });

  final VoidCallback onTap;
  final IconData icon;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primary.withValues(alpha: .1),
        ),
        child: Icon(icon, color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
