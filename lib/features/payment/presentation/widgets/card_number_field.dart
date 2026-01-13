import 'package:e_commerce/core/helpers/input_formatters.dart';
import 'package:e_commerce/core/helpers/payment_validators.dart';
import 'package:e_commerce/core/widgets/custom_labeled_text_form_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberField extends StatelessWidget {
  const CardNumberField({super.key, required this.onSaved});

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomLabeledTextFormField(
      label: S.of(context).card_number,
      hintText: '0000  0000  0000  0000',
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberInputFormatter(),
      ],
      validator: PaymentValidators.validateCardNumber,
      obscureText: false,
      textCapitalization: TextCapitalization.none,
      onSaved: onSaved,
    );
  }
}
