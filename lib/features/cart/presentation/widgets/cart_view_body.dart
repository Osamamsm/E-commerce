import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_items_list_view.dart';
import 'package:e_commerce/features/cart/presentation/widgets/order_summary_card.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: Constants.kHorizontalPaddingMedium,
            child: CartItemsListView(),
          ),
        ),
        OrderSummaryCard(),
      ],
    );
  }
}
