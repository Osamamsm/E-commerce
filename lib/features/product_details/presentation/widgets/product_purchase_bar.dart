import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/quantity_stepper.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductPurchaseBar extends StatefulWidget {
  const ProductPurchaseBar({super.key});

  @override
  State<ProductPurchaseBar> createState() => _ProductPurchaseBarState();
}

class _ProductPurchaseBarState extends State<ProductPurchaseBar> {
  int quantity = 1;
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.kHorizontalPaddingMedium,
      height: 70,
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuantityStepper(
            value: quantity,
            onIncrement: increment,
            onDecrement: decrement,
          ),
          hGap(20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).add_to_cart),
            ),
          ),
        ],
      ),
    );
  }
}
