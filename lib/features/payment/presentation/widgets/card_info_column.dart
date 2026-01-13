import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CardInfoColumn extends StatelessWidget {
  const CardInfoColumn({super.key, 
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.grey),
        ),
        vGap(4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}