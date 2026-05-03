// product_details_view_body.dart
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_description_section.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_header_section.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_images_carousel_view.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/product_reviews_section.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/variation_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/helpers/spacing.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductDetailsLoaded) {
          return _Body(state: state);
        } else if (state is ProductDetailsError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final ProductDetailsLoaded state;

  @override
  Widget build(BuildContext context) {
    final product = state.product;

    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(10),
            ProductImagesCarouselView(
              productImages: product.images.map((i) => i.imageUrl).toList(),
            ),
            vGap(20),
            ProductHeaderSection(productDetails: product),
            vGap(10),

            // Dynamic variation selectors — no hardcoding
            ...state.variationNames.map((variationName) {
              final options = state.availableOptionsFor(variationName);

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: VariationSelector(
                  label:       variationName,
                  options:     options,
                  selected:    state.selectedOptions[variationName],
                  isOutOfStock: (varEn, optEn) =>
                      state.isOptionOutOfStock(varEn, optEn),
                  onSelect: (optionEn) =>
                      context.read<ProductDetailsCubit>().selectOption(variationName, optionEn),
                ),
              );
            }),

            ProductDescriptionSection(description: product.enDescription),
            vGap(10),
            ProductReviewsSection(
              productId: product.productId,
              avgRating: product.avgRating,
              reviewsCount: product.reviewCount,
            ),
            vGap(20),
          ],
        ),
      ),
    );
  }
}