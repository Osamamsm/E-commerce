import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_color_selector.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_description_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_header_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_images_carousel_view.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_reviews_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/size_drop_down.dart';
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
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vGap(10),
            ProductImagesCarouselView(productImages: productImages),
            vGap(20),
            ProductHeaderSection(),
            vGap(10),
            ProductColorSelector(),
            vGap(20),
            SizeDropDown(
              sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
              value: 'S',
              onChanged: (value) {},
            ),
            vGap(10),
            ProductDescriptionSection(
              description:
                  'Experience the perfect blend of style and comfort with our Elegant Modern Armchair. Crafted with premium, durable fabric and a sturdy wooden frame, this chair is designed to be a timeless addition to any living space. Its ergonomic design provides excellent support, while the plush cushioning ensures maximum comfort. The minimalist aesthetic, characterized by clean lines and neutral tones, allows it to seamlessly integrate into various decor styles, from contemporary to classic. Whether you\'re curling up with a book or entertaining guests, this armchair offers a sophisticated seating solution that doesn\'t compromise on coziness.',
            ),
            vGap(10),
            ProductReviewsSection(),
          ],
        ),
      ),
    );
  }
}
