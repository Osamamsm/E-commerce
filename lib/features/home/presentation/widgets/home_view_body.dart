import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_state.dart';
import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/get_promotions_cubit/get_promotions_state.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_state.dart';
import 'package:e_commerce/features/home/presentation/views/category_products_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_filter_sort_bar.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/promotions_banner.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: CustomScrollView(
        scrollDirection: .vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 50, child: CustomSearchTextField()),
                vGap(12),
                BlocBuilder<GetPromotionsCubit, GetPromotionsState>(
                  builder: (context, state) {
                    if (state is GetPromotionsLoaded) {
                      return PromotionsBanner(promotions: state.promotions);
                    } else if (state is GetPromotionsError) {
                      return Center(child: Text(state.message));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                vGap(10),
                Text(
                  S.of(context).shop_by_category,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                vGap(12),
                BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoaded) {
                      return CategoriesListView(
                        categories: state.categories,
                        onCategorySelected: (category) {
                          context.push(
                            CategoryProductsView.routeName,
                            extra: category,
                          );
                        },
                      );
                    } else if (state is CategoriesError) {
                      return Center(child: Text(state.message));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                vGap(12),
                ProductsFilterSortBar(),
              ],
            ),
          ),
          SliverToBoxAdapter(child: vGap(12)),
          BlocBuilder<ProductFeedCubit, ProductFeedState>(
            builder: (context, state) {
              if (state is ProductFeedError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.message)),
                );
              } else if (state is ProductFeedLoaded) {
                return ProductsGridView(products: state.products);
              }
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
