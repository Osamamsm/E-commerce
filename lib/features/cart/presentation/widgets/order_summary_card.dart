import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/cart/presentation/widgets/summary_row.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: .zero,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),

      child: Column(
        children: [
          SummaryRow(label: s.subtotal, value: '1000'),
          vGap(8),
          SummaryRow(label: s.shipping, value: '1000'),
          vGap(8),
          SummaryRow(label: s.tax, value: '1000'),
          vGap(8),
          SummaryRow(label: s.discount, value: '1000'),
          vGap(8),
          Divider(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: .1),
          ),
          SummaryRow(label: s.total, value: '1000', isTotal: true),
        ],
      ),
    );
  }
}
