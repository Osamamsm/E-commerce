import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static String routeName = '/edit-profile';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).edit_profile,
      child: EditProfileViewBody(),
    );
  }
}