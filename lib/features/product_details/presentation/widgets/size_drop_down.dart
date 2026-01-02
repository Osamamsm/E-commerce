import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SizeDropDown extends StatelessWidget {
  final List<String> sizes;
  final String value;
  final ValueChanged<String> onChanged;

  const SizeDropDown({
    super.key,
    required this.sizes,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(999);

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: value,
        isExpanded: true,
        customButton: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: borderRadius,
            border: Border.all(color: theme.colorScheme.outline),
          ),
          child: Row(
            children: [
              Text(S.of(context).size, style: theme.textTheme.titleMedium),
              const Spacer(),
              Text(value, style: theme.textTheme.titleMedium),
              hGap(8),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        items: sizes
            .map(
              (size) =>
                  DropdownMenuItem<String>(value: size, child: Text(size)),
            )
            .toList(),

        onChanged: (val) {
          if (val != null) onChanged(val);
        },
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          offset: const Offset(0, 50),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
      ),
    );
  }
}
