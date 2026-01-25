import 'package:e_commerce/features/profile/presentation/widgets/edit_avatar_button.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, this.isEditable = false, required this.image});

  final bool isEditable;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
            backgroundColor: Colors.grey,
            backgroundImage: image,
          ),
        ),
        isEditable
            ? Positioned(bottom: 0, right: 0, child: EditAvatarButton())
            : SizedBox.shrink(),
      ],
    );
  }
}
