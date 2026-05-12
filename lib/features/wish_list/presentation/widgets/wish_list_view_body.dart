import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/product/data/models/product.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:e_commerce/features/wish_list/presentation/widgets/wish_list_grid_view.dart';
import 'package:e_commerce/features/wish_list/presentation/widgets/wishlist_failure_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListViewBody extends StatelessWidget {
  const WishListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: BlocBuilder<GetWishListCubit, GetWishListState>(
        builder: (context, state) {
          if (state is GetWishListFailure) {
            return WishlistFailureBody(message: state.message);
          } else if (state is GetWishListSuccess) {
            final products = state.products;
            if (products.isEmpty) {
              return WishlistEmptyBody(onBrowse: () {});
            } else {
              return WishListGridView(products: products);
            }
          }
          return WishListGridView(
            isLoading: true,
            products: [
              Product.placeholder(),
              Product.placeholder(),
              Product.placeholder(),
            ],
          );
        },
      ),
    );
  }
}

class WishlistEmptyBody extends StatelessWidget {
  final VoidCallback onBrowse;

  const WishlistEmptyBody({super.key, required this.onBrowse});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No saved items yet',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the heart on any product to save it here for later.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.55),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onBrowse,
                child: const Text('Browse Products'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
