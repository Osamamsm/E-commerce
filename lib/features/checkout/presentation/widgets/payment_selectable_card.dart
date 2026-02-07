import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_method_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/selectable_card_widget.dart';
import 'package:flutter/material.dart';

class PaymentSelectableCard extends StatelessWidget {
  final PaymentModel payment;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentSelectableCard({
    super.key,
    required this.payment,
    required this.isSelected,
    required this.onTap,
  });

  IconData _getIcon() {
    switch (payment.type) {
      case PaymentType.card:
        return Icons.credit_card;
      case PaymentType.digitalWallet:
        return Icons.account_balance_wallet;
      case PaymentType.cashOnDelivery:
        return Icons.attach_money;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableCardWidget(
      isSelected: isSelected,
      onTap: onTap,
      icon: _getIcon(),
      child: PaymentMethodDetailsSection(payment: payment),
    );
  }
}
