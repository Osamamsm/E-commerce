import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLabeledTextFormField extends StatelessWidget {
  const CustomLabeledTextFormField({
    required this.label,
    required this.keyboardType,
    required this.validator,
    required this.onSaved,
    required this.obscureText,
    this.initialValue,

    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    super.key,  this.textCapitalization =TextCapitalization.none,
  });

  final String label;
  final TextInputType keyboardType;
  final  Function(String?)? onSaved ;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? hintText;
  final TextCapitalization textCapitalization;

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
        vGap(12),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: Icon(suffixIcon),
          ),
          initialValue: initialValue,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          textCapitalization: textCapitalization,
        ),
      ],
    );
  }
}
