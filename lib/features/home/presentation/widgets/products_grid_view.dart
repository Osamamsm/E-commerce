import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});

  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 20,
        childAspectRatio: .4,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductCard(product: products[index]);
      }, childCount: products.length),
    );
  }
}
