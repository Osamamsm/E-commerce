import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_modal_progress.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:e_commerce/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  static String routeName = '/edit-profile';

  @override
  Widget build(BuildContext context) {
    final profile = GoRouterState.of(context).extra as UserProfileEntity;
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          showCustomDialog(
            context: context,
            message: state.message,
            dialogType: DialogType.error,
            onOkPressed: () {},
          );
        }
        if (state is ProfileUpdated) {
          showCustomDialog(
            context: context,
            message: S.of(context).profile_updated_successfully,
            dialogType: DialogType.success,
            onOkPressed: () {
              GoRouter.of(context).pop();
            },
          );
        }
      },
      builder: (context, state) => CustomModalProgress(
        isLoading: state is ProfileLoading,
        child: CustomScaffold(
          title: S.of(context).edit_profile,
          child: EditProfileViewBody(profile: profile),
        ),
      ),
    );
  }
}
