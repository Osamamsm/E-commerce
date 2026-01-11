import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class DefaultAddressToggle extends StatelessWidget {
  const DefaultAddressToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF581c87).withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF7e22ce).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).set_as_default_address,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              vGap(4),
              Text(
                S.of(context).use_this_address_for_checkout,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            inactiveThumbColor: const Color.fromARGB(255, 177, 95, 254),
            inactiveTrackColor: const Color.fromARGB(255, 200, 145, 255),
            activeThumbColor: const Color.fromARGB(255, 147, 51, 234),
            activeTrackColor: const Color.fromARGB(255, 54, 2, 102),
          ),
        ],
      ),
    );
  }
}
