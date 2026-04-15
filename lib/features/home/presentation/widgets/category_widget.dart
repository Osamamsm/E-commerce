import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
    this.isSelected = false,
  });

  final String name;
  final String image;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  width: 2.5,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundImage: NetworkImage(image),
                radius: 28,
              ),
            ),
            vGap(5),
            Text(name, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}