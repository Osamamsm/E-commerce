import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_cubit.dart';
import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/products_grid_view.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFeedCubit, ProductFeedState>(
      builder: (context, state) {
        if (state is ProductFeedError) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        } else if (state is ProductFeedLoaded) {
          return ProductsGridView(products: state.products);
        }
        return ProductsGridView(
          isLoading: true,
          products: [
            Product.placeholder(),
            Product.placeholder(),
            Product.placeholder(),
          ],
        );
      },
    );
  }
}
