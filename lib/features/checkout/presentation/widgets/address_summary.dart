import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:flutter/material.dart';

class AddressSummary extends StatelessWidget {
  final Address address;

  const AddressSummary({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1330),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFF2D2440),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              address.type == 'Home' ? Icons.home : Icons.business,
              color: const Color(0xFF7C3AED),
              size: 18,
            ),
          ),
          hGap(12),
          AddressDetailsSection(address: address),
        ],
      ),
    );
  }
}
