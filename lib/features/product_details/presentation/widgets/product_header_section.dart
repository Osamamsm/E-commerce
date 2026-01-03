import 'package:e_commerce/features/product_details/presentation/widgets/custom_rating_bar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            CustomRatingBar(
              isReadOnly: true,
              initialRating: 4.5,
              itemSize: 20,
            ),
            Text(
              S.of(context).review(121),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}