import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Product Name name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(height: 1.1),
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