import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class DefaultFlagWidget extends StatelessWidget {
  const DefaultFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF7e22ce).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        S.of(context).default_,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
