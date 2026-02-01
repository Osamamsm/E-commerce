import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_toggle.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationsSettingsSection extends StatefulWidget {
  const NotificationsSettingsSection({super.key});

  @override
  State<NotificationsSettingsSection> createState() =>
      _NotificationsSettingsSectionState();
}

class _NotificationsSettingsSectionState
    extends State<NotificationsSettingsSection> {
  bool _pushNotificationsEnabled = false;
  bool _orderUpdatesEnabled = false;
  bool _offersPromotionsEnabled = false;
  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: S.of(context).notifications,
      icon: '🔔',
      children: [
        SettingsToggle(
          title: S.of(context).push_notifications,
          subtitle: S.of(context).push_notifications_subtitle,
          value: _pushNotificationsEnabled,
          icon: Icons.notifications,
          colors: const [Color(0xFFEC4899), Color(0xFFFB7185)],
          onChanged: (value) {
            setState(() {
              _pushNotificationsEnabled = value;
            });
          },
        ),
        SettingsToggle(
          title: S.of(context).order_updates,
          subtitle: S.of(context).order_updates_subtitle,
          value: _orderUpdatesEnabled,
          icon: Icons.shopping_cart,
          colors: const [Color(0xFF6366F1), Color(0xFF3B82F6)],
          onChanged: (value) {
            setState(() {
              _orderUpdatesEnabled = value;
            });
          },
        ),
        SettingsToggle(
          title: S.of(context).offers_promotions,
          subtitle: S.of(context).offers_promotions_subtitle,
          value: _offersPromotionsEnabled,
          icon: Icons.local_offer,
          colors: const [Color(0xFFF59E0B), Color(0xFFF97316)],
          onChanged: (value) {
            setState(() {
              _offersPromotionsEnabled = value;
            });
          },
        ),
      ],
    );
  }
}
