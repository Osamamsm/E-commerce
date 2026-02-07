import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/circle_checkbox.dart';
import 'package:flutter/material.dart';

class SelectableCardWidget extends StatelessWidget {
  const SelectableCardWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.child,
    required this.icon,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            hGap(16),
            child,
            CircleCheckbox(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}
