import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key, required this.userProfileEntity});

  final UserProfileEntity userProfileEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: theme.colorScheme.primaryContainer,
            backgroundImage: userProfileEntity.avatarUrl != null
                ? CachedNetworkImageProvider(userProfileEntity.avatarUrl!)
                : CachedNetworkImageProvider(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                  ),
          ),
        ),
        vGap(12),
        Text(
          userProfileEntity.fullName.isNotEmpty
              ? userProfileEntity.fullName
              : 'Guest User',
          style: theme.textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (userProfileEntity.role.isNotEmpty) ...[
          vGap(6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              userProfileEntity.role,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
