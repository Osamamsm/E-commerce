class AvatarUploadState {}

class AvatarUploadInitial extends AvatarUploadState {}

class AvatarUploading extends AvatarUploadState {}

class AvatarUploadSuccess extends AvatarUploadState {
  final String avatarUrl;
  AvatarUploadSuccess(this.avatarUrl);
}

class AvatarUploadFailure extends AvatarUploadState {
  final String message;
  AvatarUploadFailure(this.message);
}