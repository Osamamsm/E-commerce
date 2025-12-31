import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_images_carousel_view.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  static const List<String> productImages = [
    'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
    'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
    'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
    'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
    'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: Column(
        children: [
          vGap(10),
          ProductImagesCarouselView(productImages: productImages),
        ],
      ),
    );
  }
}
