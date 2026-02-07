import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:flutter/material.dart';

class AddressDetailsSection extends StatelessWidget {
  const AddressDetailsSection({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          vGap(4),
          Text(
            address.city,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
          vGap(2),
          Text(
            address.street,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
          vGap(2),
          Text(
            address.city,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
          vGap(4),
          Text(
            address.phone,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
