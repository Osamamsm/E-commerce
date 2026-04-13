import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({
    super.key,required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(ProductDetailsView.routeName),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ProductImage(imageUrl: product.imageUrl, height: 220, width: double.infinity),
          vGap(12),
          Text(
            product.enName,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 1,
            overflow: .ellipsis,
          ),
          vGap(4),
          Text(product.basePrice.toString(), style: Theme.of(context).textTheme.bodySmall),
          vGap(12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => (){},
              child: Text(S.of(context).add_to_cart),
            ),
          ),
        ],
      ),
    );
  }
}
