import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 20,
        childAspectRatio: .45,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductCard(
          imageUrl:
              'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
          title: 'Vest WaterProof With fiber inside From Groowii',
          price: '599',
          onAddToCart: () {},
        );
      }, childCount: 10),
    );
  }
}