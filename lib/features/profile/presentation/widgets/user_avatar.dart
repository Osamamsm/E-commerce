import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.isEditable = false,
    required this.image,
  });

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
            backgroundColor: const Color(0xFFFFDBB5),
            backgroundImage: image,
          ),
        ),
        isEditable
            ? Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    context.read<ImagePickerCubit>().pickImage();
                  },
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
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
