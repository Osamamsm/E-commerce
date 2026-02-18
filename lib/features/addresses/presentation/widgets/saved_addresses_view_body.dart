import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card.dart';
import 'package:flutter/material.dart';

class SavedAddressesViewBody extends StatelessWidget {
  const SavedAddressesViewBody({super.key, required this.addresses});

  final List<AddressEntity> addresses;

  Map<String, List<Address>> _groupAddressesByType() {
    Map<String, List<Address>> grouped = {'home': [], 'work': [], 'other': []};

    for (var address in TestingLists.addresses) {
      String type = address.type.toLowerCase();
      if (grouped.containsKey(type)) {
        grouped[type]!.add(address);
      } else {
        grouped['other']!.add(address);
      }
    }

    // Remove empty categories
    grouped.removeWhere((key, value) => value.isEmpty);
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final groupedAddresses = _groupAddressesByType();
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final categories = groupedAddresses.keys.toList();
              final category = categories[index];
              final categoryAddresses = groupedAddresses[category]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index > 0) const SizedBox(height: 24),
                  // Category Header
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 12),
                    child: Text(
                      category.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  // Address Cards
                  ...List.generate(categoryAddresses.length, (addressIndex) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: addressIndex < categoryAddresses.length - 1
                            ? 16
                            : 0,
                      ),
                      child: AddressCard(
                        address: categoryAddresses[addressIndex],
                      ),
                    );
                  }),
                ],
              );
            }, childCount: groupedAddresses.length),
          ),
        ),
      ],
    );
  }
}
