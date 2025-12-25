import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: .vertical,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CustomSearchTextField(),
              vGap(12),
              Text(
                S.of(context).shop_by_category,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              vGap(12),
              CategoriesListView(),
              vGap(12),
              Text(
                S.of(context).featured_products,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: vGap(12)),
        ProductsGridView(),
      ],
    );
  }
}
