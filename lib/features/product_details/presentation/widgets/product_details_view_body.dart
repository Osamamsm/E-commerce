import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/quantity_stepper.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_color_selector.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_description_section.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_images_carousel_view.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/size_drop_down.dart';
import 'package:e_commerce/generated/l10n.dart';
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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 16, left: 16, bottom: 100),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vGap(10),
                ProductImagesCarouselView(productImages: productImages),
                vGap(20),
                Text(
                  'Vest WaterProof With fiber',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                Row(
                  children: [
                    Text(
                      '\$599',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Spacer(flex: 1),
                    CustomRatingBar(isReadOnly: true, initialRating: 4.5),
                    Text(
                      '(${S.of(context).review(121)})',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                vGap(10),
                Text(
                  S.of(context).color,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
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
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: Constants.kHorizontalPaddingMedium,
            height: 70,
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantityStepper(
                  value: 1,
                  onIncrement: () {},
                  onDecrement: () {},
                ),
                hGap(20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(S.of(context).add_to_cart),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


