import 'package:flutter/material.dart';

class GlassTextField extends StatelessWidget {
  const GlassTextField({super.key, required this.hintText, this.suffixIcon});

  final String hintText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: const Color(0xFF9ca3af), size: 20)
            : null,
      ),
    );
  }
}
