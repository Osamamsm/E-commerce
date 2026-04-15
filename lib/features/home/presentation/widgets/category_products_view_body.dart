import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_card.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryProductsViewBody extends StatelessWidget {
  const CategoryProductsViewBody({super.key, required this.subCategories});

  final List<Category> subCategories;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesListView(
          categories: subCategories,
          onCategorySelected: (category) {},
        ),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 10,
            childAspectRatio: .4,
          ),
          children: [].map((product) => ProductCard(product: product)).toList(),
        ),
      ],
    );
  }
}
