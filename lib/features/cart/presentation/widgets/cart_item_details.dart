import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            'Product Name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(height: 1.3),
          ),
          Text(
            '${s.color} : Lavender\n${s.size}   : M',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: .start,
          ),
          Text('100 EGP', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
