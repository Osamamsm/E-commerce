import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_type_chip.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressTypeSelector extends StatelessWidget {
  const AddressTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  final String selectedType;
  final ValueChanged<String> onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            S.of(context).label_as,
            style: TextStyle(
              color: Color(0xFF9ca3af),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Row(
          children: [
            AddressTypeChip(
              icon: Icons.home,
              label: S.of(context).home,
              isSelected: selectedType == 'Home',
              onTap: () => onTypeSelected('Home'),
            ),
            hGap(12),
            AddressTypeChip(
              icon: Icons.business,
              label: S.of(context).work,
              isSelected: selectedType == 'Work',
              onTap: () => onTypeSelected('Work'),
            ),
            hGap(12),
            AddressTypeChip(
              icon: Icons.location_on,
              label: S.of(context).other,
              isSelected: selectedType == 'Other',
              onTap: () => onTypeSelected('Other'),
            ),
          ],
        ),
      ],
    );
  }
}
