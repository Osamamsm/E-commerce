import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SecurityInfo extends StatelessWidget {
  const SecurityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.lock_outline,
          color: Colors.white.withValues(alpha: 0.5),
          size: 16,
        ),
        hGap(8),
        Text(
          S.of(context).your_payment_info_is_stored_securely,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
