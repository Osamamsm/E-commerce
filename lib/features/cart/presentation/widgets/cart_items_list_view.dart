import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) => const CartItemWidget(),
      separatorBuilder: (context, index) => vGap(12),
    );
  }
}