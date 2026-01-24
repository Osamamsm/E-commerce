import 'dart:io';

import 'package:e_commerce/features/profile/domain/use_cases/update_avatar_use_case.dart';
import 'package:e_commerce/features/profile/presentation/logic/avatar_upload_cubit/avatar_upload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarUploadCubit extends Cubit<AvatarUploadState> {
final UpdateAvatarUseCase _updateAvatarUseCase;

  AvatarUploadCubit(this._updateAvatarUseCase)
      : super(AvatarUploadInitial());

  Future<void> uploadAvatar(File file) async {
    emit(AvatarUploading());
    try {
      await _updateAvatarUseCase(file);
      emit(AvatarUploadSuccess(''));
    } catch (e) {
      emit(AvatarUploadFailure(e.toString()));
    }
  }
}
