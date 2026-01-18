import 'package:e_commerce/features/wish_list/presentation/widgets/wishlist_product_card.dart';
import 'package:flutter/material.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.63,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const WishlistProductCard(
                  imageUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuA6OOJUU2d11VuboNdsbW9NU-MCDa87jpdLKCOgoocimgPT16CoHYnRUVijhvGE7esI_-cc5oKo909tR_9icPiA-e3sbKNTKp_xX6DAtJ9G69H_ENMNw2fw8KtJfIQp2RhiUtNx5zJChh9VMLPbccA_0OUNJwyeLy0ytWNj083-LcCfSKRFV4K7y-BX-Ay38vVE-NX_QcGuD3-mh8WPQPa-_-n0KjdoZErkZr4zFqlCHfGq0tdfUR2uV7MilntwOQddNwMaX6Xb99w",
                  title: 'Classic Leather Jacket',
                  price: '199.99',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
