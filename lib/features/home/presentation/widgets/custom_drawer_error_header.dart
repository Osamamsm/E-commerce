import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/get_profile_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawerErrorHeader extends StatelessWidget {
  const CustomDrawerErrorHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          child: Icon(Icons.error_outline, size: 35, color: Colors.white),
        ),
        vGap(12),
        Text(
          S.of(context).failed_to_load_profile,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        vGap(8),
        TextButton(
          onPressed: () {
            context.read<GetProfileCubit>().getProfile();
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                S.of(context).retry,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
