// product_details_view_body.dart
import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_error_body.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_details_loaded_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Skeletonizer(
            child: ProductDetailsLoadedBody(
              product: ProductDetails.placeholder(),
              variationNames: [],
              selectedOptions: const {},
              availableOptionsFor: (_) => [],
              isOptionOutOfStock: (_, _) => false,
            ),
          );
        } else if (state is ProductDetailsLoaded) {
          return ProductDetailsLoadedBody(
            product: state.product,
            variationNames: state.variationNames,
            selectedOptions: state.selectedOptions,
            availableOptionsFor: state.availableOptionsFor,
            isOptionOutOfStock: state.isOptionOutOfStock,
          );
        } else if (state is ProductDetailsError) {
          return ProductDetailsErrorBody(
            message: state.message,
            onRetry: () => context.read<ProductDetailsCubit>().loadProductDetails(productId),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
