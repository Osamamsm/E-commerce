import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

static String routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).settings,
      child: SettingsViewBody(),
    );
  }
}