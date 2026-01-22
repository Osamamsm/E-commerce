import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/views/edit_profile_view.dart';
import 'package:e_commerce/features/profile/presentation/widgets/user_avatar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<ProfileCubit>().profile;
    return Column(
      children: [
        UserAvatar(),
        vGap(16),
        Text(
          profile?.fullName ?? 'User',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        vGap(4),
        Text(
          profile?.email ?? 'user@example.com',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        vGap(16),
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
      ],
    );
  }
}
