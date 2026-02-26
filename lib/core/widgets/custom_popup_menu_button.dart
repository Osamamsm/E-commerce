import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.onSetAsDefault,
    required this.isDefault,
  });

  final VoidCallback onEdit;
  final VoidCallback onSetAsDefault;
  final VoidCallback onDelete;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Theme.of(context).colorScheme.primaryContainer,
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit();
            break;
          case 'delete':
            onDelete();
            break;
          case 'set_as_default':
            onSetAsDefault();
        }
      },
      itemBuilder: (context) => [
        CustomPopupMenuItem(
          value: 'edit',
          icon: Icons.edit,
          text: S.of(context).edit,
        ),
        CustomPopupMenuItem(
          value: 'delete',
          icon: Icons.delete,
          text: S.of(context).delete,
        ),
        if (!isDefault)
          CustomPopupMenuItem(
            value: 'set_as_default',
            icon: Icons.location_city_outlined,
            text: S.of(context).set_as_default,
          ),
      ],
    );
  }
}

class CustomPopupMenuItem extends PopupMenuItem<String> {
  CustomPopupMenuItem({
    super.key,
    required String value,
    required IconData icon,
    required String text,
  }) : super(
         value: value,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [Icon(icon), hGap(8), Text(text)],
         ),
       );
}
