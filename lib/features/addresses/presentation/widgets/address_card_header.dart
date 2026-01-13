import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/default_flag_widget.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';

class AddressCardHeader extends StatelessWidget {
  const AddressCardHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.isDefault,
  });

  final IconData icon;
  final String title;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF7e22ce).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFFe9d5ff), size: 20),
        ),
        hGap(12),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        hGap(8),
        if (isDefault) DefaultFlagWidget(),
        const Spacer(),
        CustomPopupMenuButton(onEdit: (value) {}, onDelete: (value) {}),
      ],
    );
  }
}
