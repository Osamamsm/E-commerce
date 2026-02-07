import 'package:flutter/material.dart';

class CircleCheckbox extends StatelessWidget {
  const CircleCheckbox({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFF2D2440),
          width: 2,
        ),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
      ),
      child: isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 16)
          : null,
    );
  }
}
