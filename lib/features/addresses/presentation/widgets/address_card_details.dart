import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class AddressCardDetails extends StatelessWidget {
  const AddressCardDetails({super.key, 
    required this.owner,
    required this.city,
    required this.street,
  });

  final String owner;
  final String city;
  final String street;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(owner, style: Theme.of(context).textTheme.bodySmall),
        vGap(4),
        Text(city, style: Theme.of(context).textTheme.bodySmall),
        vGap(4),
        Text(
          street,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(height: 1.5),
        ),
      ],
    );
  }
}
