import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_cubit.dart';
import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_state.dart';
import 'package:e_commerce/core/widgets/custom_labeled_text_form_field.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/logic/avatar_upload_cubit/avatar_upload_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/user_avatar.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.profile});

  final UserProfileEntity profile;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String fullName, email, phoneNumber;

  @override
  void initState() {
    fullName = widget.profile.fullName;
    email = widget.profile.email;
    phoneNumber = widget.profile.phoneNumber ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: UserAvatar(
                isEditable: true,
                avatarUrl: widget.profile.avatarUrl,
              ),
            ),
            vGap(32),
            CustomLabeledTextFormField(
              label: S.of(context).full_name,
              validator: Validators.fullNameValidator,
              onSaved: (value) {
                fullName = value!;
              },
              initialValue: fullName,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              suffixIcon: Icons.person,
            ),
            vGap(16),
            CustomLabeledTextFormField(
              enabled: false,
              label: S.of(context).email,
              suffixIcon: Icons.lock_outline,
              validator: Validators.emailValidator,
              onSaved: (value) {
                email = value!;
              },
              initialValue: email,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
            ),
            vGap(16),
            CustomLabeledTextFormField(
              label: S.of(context).phone_number,
              suffixIcon: Icons.phone,
              validator: Validators.phoneNumberValidator,
              onSaved: (value) {
                phoneNumber = value!;
              },
              initialValue: phoneNumber,
              keyboardType: TextInputType.phone,
              obscureText: false,
            ),
            vGap(32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final state = context.read<ImagePickerCubit>().state;
                  if (state is ImagePicked) {
                    final image = state.image;
                    context.read<AvatarUploadCubit>().uploadAvatar(image);
                  }

                  context.read<ProfileCubit>().updateProfile(
                    UserProfileEntity(
                      id: widget.profile.id,
                      fullName: fullName,
                      email: email,
                      phoneNumber: phoneNumber,
                      role: widget.profile.role,
                      createdAt: widget.profile.createdAt,
                    ),
                  );
                }
              },
              child: Text(
                S.of(context).save,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            vGap(24),
          ],
        ),
      ),
    );
  }
}
