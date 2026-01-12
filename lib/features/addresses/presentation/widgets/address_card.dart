import 'dart:ui';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card_actions.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card_details.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card_header.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});

  final Address address;

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'work':
        return Icons.business;
      case 'other':
      default:
        return Icons.location_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFF581c87).withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Color(0xFF7e22ce).withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddressCardHeader(
                icon: _getIconForType(address.type),
                title: address.title,
                isDefault: address.isDefault,
              ),
              vGap(16),
              AddressCardDetails(
                owner: address.owner,
                city: address.city,
                street: address.street,
              ),
              vGap(16),
              AddressCardActions(address: address),
            ],
          ),
        ),
      ),
    );
  }
}
