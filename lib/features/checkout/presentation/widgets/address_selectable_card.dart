import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/selectable_card_widget.dart';
import 'package:flutter/material.dart';

class AddressSelectableCard extends StatelessWidget {
  final Address address;
  final bool isSelected;
  final VoidCallback onTap;

  const AddressSelectableCard({
    super.key,
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableCardWidget(
      isSelected: isSelected,
      onTap: onTap,
      icon: address.type == 'home' ? Icons.home : Icons.business,
      child: AddressDetailsSection(address: address),
    );
  }
}
