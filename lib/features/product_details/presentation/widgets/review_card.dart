import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/I/61QIwXhA0fL._AC_SY741_.jpg',
              ),
            ),
            hGap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'October 25,2022',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                ),
              ],
            ),
            hGap(50),
            CustomRatingBar(isReadOnly: true, initialRating: 4.5, itemSize: 15),
          ],
        ),
        vGap(10),
        Text(
          'Absolutely love this chair! It\'s stylish, comfortable, and was very easy to assemble, It\'s the perfect addition to my living room.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}