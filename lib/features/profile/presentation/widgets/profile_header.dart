import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/views/edit_profile_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF9333ea), width: 3),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFFFDBB5),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: const Color(0xFFD4A574),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9333ea),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF1e1b4b),
                      width: 2,
                    ),
                  ),
                  child: const Icon(Icons.edit, size: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        vGap(16),
        Text('Alex Sterling', style: Theme.of(context).textTheme.titleLarge),
        vGap(4),
        Text(
          'alex.sterling@example.com',
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
