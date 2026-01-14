import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).profile,
      child: ProfileViewBody(),
    );
  }
}
