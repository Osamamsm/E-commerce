import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/addresses/presentation/views/edit_address_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressCardActions extends StatelessWidget {
  const AddressCardActions({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!address.isDefault) ...[
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
          onPressed: () {
            GoRouter.of(
              context,
            ).push(EditAddressView.routeName, extra: address);
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFd8b4fe),
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(S.of(context).edit),
        ),
        if (address.isDefault) ...[
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
