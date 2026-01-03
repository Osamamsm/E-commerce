import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/size_drop_down_trigger.dart';
import 'package:flutter/material.dart';

class SizeDropDown extends StatefulWidget {
  final List<String> sizes;
  final String initialValue;

  const SizeDropDown({
    super.key,
    required this.sizes,
    required this.initialValue,
  });

  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  String value = '';

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: value,
        isExpanded: true,
        customButton: SizeDropdownTrigger(value: value),
        items: widget.sizes
            .map(
              (size) =>
                  DropdownMenuItem<String>(value: size, child: Text(size)),
            )
            .toList(),

        onChanged: (val) {
          if (val != null) setState(() => value = val);
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
