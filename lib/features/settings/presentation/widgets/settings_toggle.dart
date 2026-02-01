import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/settings/presentation/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';

class SettingsToggle extends StatelessWidget {
  const SettingsToggle({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.icon,
    required this.colors,
    required this.onChanged,
  });

  final String title;
  final String? subtitle;
  final bool value;
  final IconData icon;
  final List<Color> colors;
  final Function(bool) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          CustomIconWidget(colors: colors, icon: icon),
          hGap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                vGap(2),
                Text(
                  subtitle ?? '',
                  style: TextStyle(
                    color: Color(0xFFA78BFA),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color.fromARGB(255, 255, 255, 255),
            activeTrackColor: const Color.fromARGB(255, 112, 1, 216),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
          ),
        ],
      ),
    );
  }
}
