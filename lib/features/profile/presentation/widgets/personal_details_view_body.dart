import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/views/edit_profile_view.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_info_item.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_info_section.dart';
import 'package:e_commerce/features/profile/presentation/widgets/user_avatar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalDetailsViewBody extends StatelessWidget {
  const PersonalDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<ProfileCubit>().profile;
    final sections = Constants.getProfileInfoSections(context, profile);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: UserAvatar()),
          vGap(24),
          ...sections.map((section) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ProfileInfoSection(
                title: section['title'],
                items: (section['items'] as List).map((item) {
                  return ProfileInfoItem(
                    icon: item['icon'],
                    label: item['label'],
                    value: item['value'],
                    valueColor: item['valueColor'],
                  );
                }).toList(),
              ),
            );
          }),
          vGap(24),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(EditProfileView.routeName,extra: profile);
            },
            child: Text(S.of(context).edit_profile),
          ),
          vGap(24),
        ],
      ),
    );
  }
}
