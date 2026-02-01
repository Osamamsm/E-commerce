import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/settings/presentation/widgets/custom_icon_widget.dart';
import 'package:e_commerce/features/settings/presentation/widgets/show_selector_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.title,
    required this.selectLabel,
    required this.icon,
    required this.value,
    required this.options,
    required this.onChanged,
    required this.colors,
  });

  final String title;
  final String selectLabel;
  final IconData icon;
  final String value;
  final List<String> options;
  final Function(String) onChanged;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showSelectorBottomSheet(
          context,
          selectLabel,
          options,
          value,
          onChanged,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              CustomIconWidget(colors: colors, icon: icon),
              hGap(16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: const Color(0xFFA78BFA).withValues(alpha: 0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hGap(8),
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
