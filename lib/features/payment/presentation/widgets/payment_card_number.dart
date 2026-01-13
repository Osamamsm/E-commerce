import 'package:flutter/material.dart';

class PaymentCardNumber extends StatelessWidget {
  const PaymentCardNumber({super.key, required this.lastFour});

  final String lastFour;

  @override
  Widget build(BuildContext context) {
    return Text(
      '•••• •••• •••• $lastFour',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
