import 'package:e_commerce/core/helpers/input_formatters.dart';
import 'package:e_commerce/core/helpers/payment_validators.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/custom_labeled_text_form_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpiryAndCvvRow extends StatelessWidget {
  const ExpiryAndCvvRow({super.key, 
    required this.onExpiryDateSaved,
    required this.onCvvSaved,
  });

  final FormFieldSetter<String> onExpiryDateSaved;
  final FormFieldSetter<String> onCvvSaved;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomLabeledTextFormField(
            label: S.of(context).expiry_date,
            hintText: 'MM/YY',
            prefixIcon: const Icon(Icons.calendar_today),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ExpiryDateInputFormatter(),
            ],
            validator: PaymentValidators.validateExpiryDate,
            textCapitalization: TextCapitalization.none,
            obscureText: false,
            onSaved: onExpiryDateSaved,
          ),
        ),
        hGap(12),
        Expanded(
          child: CustomLabeledTextFormField(
            label: S.of(context).cvv_cvc,
            hintText: '123',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: const Icon(Icons.help_outline),
            keyboardType: TextInputType.number,
            obscureText: true,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            validator: PaymentValidators.validateCVV,
            textCapitalization: TextCapitalization.none,
            onSaved: onCvvSaved,
          ),
        ),
      ],
    );
  }
}