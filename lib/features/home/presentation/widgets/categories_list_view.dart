import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

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
            name: 'Men',
            image:
                'https://i.pinimg.com/474x/9c/dc/3f/9cdc3f2657f9948361fa31381f638f09.jpg',
          );
        },
        separatorBuilder: (context, index) {
          return hGap(14);
        },
        itemCount: 10,
      ),
    );
  }
}