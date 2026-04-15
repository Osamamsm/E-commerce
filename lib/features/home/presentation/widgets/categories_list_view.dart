import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_widget.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  final List<Category> categories;
  final void Function(Category category) onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 12, vertical: 8),
      height: 110,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: .circular(20),
      ),
      child: ListView.separated(
        scrollDirection: .horizontal,
        itemBuilder: (context, index) {
          return CategoryWidget(
            category: categories[index],
            onCategorySelected: onCategorySelected,
          );
        },
        separatorBuilder: (context, index) {
          return hGap(14);
        },
        itemCount: categories.length,
      ),
    );
  }
}
