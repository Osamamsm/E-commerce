import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_menu_section.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_header.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              }
              return SizedBox.shrink();
            },
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
