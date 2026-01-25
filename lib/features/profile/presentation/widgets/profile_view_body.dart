import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/custom_error_header.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:e_commerce/features/profile/presentation/views/edit_profile_view.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_menu_section.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_header.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = Constants.getProfileMenuSections(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                final profile = state.userProfileEntity;
                return ProfileHeader(profile: profile);
              } else if (state is ProfileError) {
                return CustomErrorHeader();
              } else {
                return Skeletonizer(child: ProfileHeader());
              }
            },
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push(EditProfileView.routeName);
              },
              child: Text(
                S.of(context).edit_profile,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          vGap(24),
          ...sections.map((section) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ProfileMenuSection(
                title: section['title'],
                items: (section['items'] as List).map((item) {
                  return ProfileMenuItem(
                    icon: item['icon'],
                    title: item['title'],
                    isSignout: item['isSignout'] ?? false,
                    onTap: item['onTap'],
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
