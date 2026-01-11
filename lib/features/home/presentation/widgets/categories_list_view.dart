import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

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
                'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
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
