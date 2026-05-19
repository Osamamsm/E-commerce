import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistFailureBody extends StatelessWidget {
  const WishlistFailureBody({
    super.key, required this.message,
  });
final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: .05)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 34,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
    
          const SizedBox(height: 18),
    
          const Text(
            'Unable to load wishlist',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
    
          const SizedBox(height: 8),
    
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: .7),
              fontSize: 14,
              height: 1.5,
            ),
          ),
    
          // if (onRetry != null) ...[
          const SizedBox(height: 20),
    
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: context.read<GetWishListCubit>().getWishList,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Try Again'),
            ),
          ),
        ],
        //],
      ),
    );
  }
}
