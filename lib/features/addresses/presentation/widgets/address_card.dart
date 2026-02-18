import 'dart:ui';
import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card_header.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address});

  final AddressEntity address;

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Home':
        return Icons.home;
      case 'Work':
        return Icons.business;
      case 'Other':
      default:
        return Icons.location_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
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
              icon: _getIconForType(address.label),
              title: address.label,
              isDefault: address.isDefault,
            ),
            vGap(16),
            Text(
              getFormattedAddress(address: address),
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: .start,
            ),
            vGap(16),
            //AddressCardActions(address: address),
          ],
        ),
      ),
    );
  }
}
