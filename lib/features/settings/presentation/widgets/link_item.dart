import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/settings/presentation/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';

class LinkItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final List<Color> colors;

  const LinkItem({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              CustomIconWidget(colors: colors, icon: icon),
              hGap(16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.open_in_new,
                color: const Color(0xFFA78BFA).withValues(alpha: 0.8),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
