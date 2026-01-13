import 'package:e_commerce/features/payment/presentation/widgets/card_info_column.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentCardFooter extends StatelessWidget {
  const PaymentCardFooter({
    super.key,
    required this.cardHolderName,
    required this.expiryDate,
  });

  final String cardHolderName;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardInfoColumn(label: S.of(context).card_holder, value: cardHolderName),
        CardInfoColumn(label: S.of(context).expires, value: expiryDate),
      ],
    );
  }
}
