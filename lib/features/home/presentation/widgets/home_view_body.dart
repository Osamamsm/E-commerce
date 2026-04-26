import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/categories_cubit/categories_state.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_state.dart';
import 'package:e_commerce/features/home/presentation/views/category_products_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_search_text_field.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_filter_sort_bar.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:e_commerce/features/home/presentation/widgets/promotions_banner.dart';
import 'package:e_commerce/features/product/data/models/promotion.dart';
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
                PromotionsBanner(
                  promotions: [
                    Promotion(
                      id: '1',
                      title: 'Summer Sale',
                      description: 'Up to 50% off on selected items',
                      discountPercentage: 50.0,
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(const Duration(days: 7)),

                      imageUrl:
                          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
                    ),
                    Promotion(
                      id: '2',
                      title: 'New Arrivals',
                      description: 'Check out the latest products in our store',
                      discountPercentage: 20.0,
                      startDate: DateTime.now(),
                      endDate: DateTime.now().add(const Duration(days: 7)),
                      imageUrl:
                          'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=800&q=80',
                    ),
                  ],
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
                ProductsFilterSortBar(
                  filterState: ProductFilterState(),
                  onFilterChanged: (state) {},
                ),
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
