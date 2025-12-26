import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        ProductImage(imageUrl: imageUrl, height: 220, width: double.infinity),
        vGap(12),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
          maxLines: 1,
          overflow: .ellipsis,
        ),
        vGap(4),
        Text(price, style: Theme.of(context).textTheme.bodySmall),
        vGap(12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onAddToCart,
            child: Text(S.of(context).add_to_cart),
          ),
        ),
      ],
    );
  }
}
