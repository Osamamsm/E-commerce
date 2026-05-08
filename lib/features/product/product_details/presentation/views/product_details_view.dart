import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_view_body.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_purchase_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const routeName = '/product-details-view';
  @override
  Widget build(BuildContext context) {
    final productId = GoRouterState.of(context).extra as String;
    return CustomScaffold(
      actionWidgets: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
      ],
      customBottomNavigationBar: ProductPurchaseBar(),
      child: ProductDetailsViewBody(productId: productId),
    );
  }
}
