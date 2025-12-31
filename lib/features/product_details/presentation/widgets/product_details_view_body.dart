import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/product_images_carousel_view.dart';
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
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
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
          Text('599\$', style: Theme.of(context).textTheme.titleSmall),
          Row(
            children: [
              CustomRatingBar(isReadOnly: true, initialRating: 4.5),
              Text(
                '(${S.of(context).review(121)})',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
