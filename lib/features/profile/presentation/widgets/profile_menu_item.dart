import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isSignout = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isSignout;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSignout ? const Color(0xFFf87171) : Colors.white,
            ),
            hGap(16),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isSignout ? const Color(0xFFf87171) : Colors.white,
                ),
              ),
            ),
            isSignout
                ? const SizedBox()
                : Icon(
                    Icons.chevron_right,
                    color: Colors.white.withValues(alpha: 0.5),
                    size: 25,
                  ),
          ],
        ),
      ),
    );
  }
}
