import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.onCategorySelected,
  });

  final Category category;
  final void Function(Category category) onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategorySelected(category),
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              backgroundImage: NetworkImage(category.imageUrl),
              radius: 30,
            ),
            vGap(5),
            Text(category.enName, overflow: .ellipsis),
          ],
        ),
      ),
    );
  }
}
