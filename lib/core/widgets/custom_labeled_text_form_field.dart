import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLabeledTextFormField extends StatelessWidget {
  const CustomLabeledTextFormField({
    required this.label,
    required this.keyboardType,
    required this.validator,
    required this.onChanged,
    required this.obscureText,
    this.initialValue,

    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    super.key,
  });

  final String label;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          initialValue: initialValue,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
