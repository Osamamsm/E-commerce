import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundImage: NetworkImage(category.imageUrl),
          radius: 30,
        ),
        vGap(5),
        Text(category.enName, overflow: .ellipsis),
      ],
    );
  }
}