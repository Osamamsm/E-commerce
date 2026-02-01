import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/settings/presentation/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';

class SecurityItem extends StatelessWidget {
  const SecurityItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
    required this.colors,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final List<Color> colors;

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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFFA78BFA).withValues(alpha: 0.8),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
