import 'package:flutter/material.dart';

class ExpandableSectionHeader extends StatelessWidget {
  const ExpandableSectionHeader({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
  });

  final String title;
  final bool isExpanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ),
        GestureDetector(
          onTap: onTap,
          child: AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
  }
}