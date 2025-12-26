import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/core/widgets/quantity_stepper.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_details.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({super.key});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(10),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: .center,
        children: [
          ProductImage(
            imageUrl:
                'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            height: 100,
            width: 80,
          ),
          hGap(12),
          const CartItemDetails(),
          hGap(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: .end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              QuantityStepper(
                value: quantity,
                onIncrement: () => setState(() => quantity++),
                onDecrement: () => setState(() => quantity--),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
