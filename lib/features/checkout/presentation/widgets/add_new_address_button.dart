import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/addresses/presentation/views/add_address_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AddAddressView.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF2D2440),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF6B6B7B),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.surface,
                size: 16,
              ),
            ),
            hGap(12),
            Text(
              S.of(context).add_new_address,
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: const Color(0xFF6B6B7B)),
            ),
          ],
        ),
      ),
    );
  }
}
