import 'package:e_commerce/core/helpers/payment_validators.dart';
import 'package:e_commerce/core/widgets/custom_labeled_text_form_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CardHolderNameField extends StatelessWidget {
  const CardHolderNameField({super.key, required this.onSaved});

  final FormFieldSetter<String> onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomLabeledTextFormField(
      label: S.of(context).card_holder_name,
      hintText: 'Alex Morgan',
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
      validator: PaymentValidators.validateCardHolderName,
      obscureText: false,
      onSaved: onSaved,
    );
  }
}
