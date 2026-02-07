import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/summary_row.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double tax;
  final double total;

  const PriceSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1330),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
            children: [
              SummaryRow(label: s.subtotal, value: subtotal),
              vGap(8),
              SummaryRow(label: s.shipping, value: shipping),
              vGap(8),
              SummaryRow(label: s.tax, value: tax),
              vGap(8),
              SummaryRow(label: s.discount, value: 0),
              vGap(8),
              Divider(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: .1),
              ),
              SummaryRow(label: s.total, value: total, isTotal: true),
              vGap(8),
            ],
          ),
    );
  }
}
