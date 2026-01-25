import 'package:e_commerce/core/widgets/custom_error_header.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_header.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DrawerHeaderBlocBuilder extends StatelessWidget {
  const DrawerHeaderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return CustomDrawerHeader(userProfileEntity: state.userProfileEntity);
        } else if (state is ProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: CustomDrawerHeader(
              userProfileEntity: UserProfileEntity(
                id: '',
                fullName: 'Loading User',
                email: 'Loading User',
                avatarUrl: null,
                role: '',
                createdAt: DateTime.now(),
              ),
            ),
          );
        } else if (state is ProfileError) {
          return const CustomErrorHeader();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
