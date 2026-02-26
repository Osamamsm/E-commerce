import 'package:flutter/material.dart';

class GlassTextField extends StatelessWidget {
  const GlassTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1
  });

  final String hintText;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String? initialValue;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      maxLines: maxLines,
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
