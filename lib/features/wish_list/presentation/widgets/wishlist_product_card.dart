import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/product_image.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/features/wish_list/presentation/widgets/fav_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WishlistProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const WishlistProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(ProductDetailsView.routeName),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ProductImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 130,
                ),
              ),
              const Positioned(top: 8, right: 8, child: FavButton()),
            ],
          ),
          vGap(8),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(height: 1.2),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          vGap(4),
          Text(
            '\$$price',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
