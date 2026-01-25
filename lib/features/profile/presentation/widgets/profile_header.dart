import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, this.profile});

  final UserProfileEntity? profile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAvatar(
          image: resolveUserAvatarImage(avatarUrl: profile?.avatarUrl),
        ),
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
      ],
    );
  }
}
