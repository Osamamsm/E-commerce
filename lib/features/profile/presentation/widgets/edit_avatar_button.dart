import 'package:e_commerce/core/logic/image_picker_cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAvatarButton extends StatelessWidget {
  const EditAvatarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ImagePickerCubit>().pickImage();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color(0xFF9333ea),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF1e1b4b), width: 2),
        ),
        child: const Icon(Icons.edit, size: 16, color: Colors.white),
      ),
    );
  }
}
