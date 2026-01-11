import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressCardActions extends StatelessWidget {
  const AddressCardActions({super.key, required this.isDefault});

  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isDefault) ...[
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFd8b4fe),
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(S.of(context).set_as_default),
          ),
          hGap(16),
        ],
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFd8b4fe),
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(S.of(context).edit),
        ),
        if (isDefault) ...[
          hGap(16),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFf87171),
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ],
    );
  }
}