import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

ImageProvider resolveUserAvatarImage({File? pickedImage, String? avatarUrl}) {
  if (pickedImage != null) {
    return FileImage(pickedImage);
  } else if (avatarUrl != null) {
    return CachedNetworkImageProvider(avatarUrl);
  } else {
    return CachedNetworkImageProvider(
      'https://cdn-icons-png.flaticon.com/512/149/149071.png',
    );
  }
}
