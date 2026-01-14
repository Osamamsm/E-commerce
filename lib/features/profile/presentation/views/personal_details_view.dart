import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/profile/presentation/widgets/personal_details_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PersonalDetailsView extends StatelessWidget {
  const PersonalDetailsView({super.key});

  static String routeName = '/personal-details';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).personal_details,
      child: PersonalDetailsViewBody(),
    );
  }
}