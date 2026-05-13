import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishListGridView extends StatelessWidget {
  const WishListGridView({
    super.key,
    required this.products,
    this.isLoading = false,
  });

  final List<Product> products;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 10,
          childAspectRatio: .4,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
