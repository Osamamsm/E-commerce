import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card.dart';
import 'package:flutter/material.dart';

class SavedAddressesViewBody extends StatelessWidget {
  const SavedAddressesViewBody({super.key, required this.addresses});

  final List<AddressEntity> addresses;

  Map<String, List<AddressEntity>> _groupAddressesByType() {
    Map<String, List<AddressEntity>> grouped = {'Home': [], 'Work': [], 'Other': []};

    for (var address in addresses) {
      if (grouped.containsKey(address.label)) {
        grouped[address.label]!.add(address);
      } else {
        grouped['Other']!.add(address);
      }
    }

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
