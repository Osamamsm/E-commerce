import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_cubit.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/wish_list_cubit/wish_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavButton extends StatelessWidget {
  final String productId;

  const FavButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WishlistCubit, WishlistState, bool>(
      selector: (state) => state.isWishListed(productId),
      builder: (context, isWishListed) {
        return GestureDetector(
          onTap: () => context.read<WishlistCubit>().toggle(productId),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(
              isWishListed ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: 16,
            ),
          ),
        );
      },
    );
  }
}