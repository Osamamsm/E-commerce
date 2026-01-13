import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/default_toggle.dart';
import 'package:e_commerce/features/payment/presentation/widgets/card_holder_name_field.dart';
import 'package:e_commerce/features/payment/presentation/widgets/card_number_field.dart';
import 'package:e_commerce/features/payment/presentation/widgets/expiry_and_cvv_row.dart';
import 'package:e_commerce/features/payment/presentation/widgets/security_info.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodViewBody extends StatefulWidget {
  const AddPaymentMethodViewBody({super.key});

  @override
  State<AddPaymentMethodViewBody> createState() =>
      _AddPaymentMethodViewBodyState();
}

class _AddPaymentMethodViewBodyState extends State<AddPaymentMethodViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool isDefault = false;

  late String cardNumber, holderName, expiryDate, cvv;

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardNumberField(onSaved: (value) => cardNumber = value!),
              vGap(12),
              CardHolderNameField(onSaved: (value) => holderName = value!),
              vGap(12),
              ExpiryAndCvvRow(
                onExpiryDateSaved: (value) => expiryDate = value!,
                onCvvSaved: (value) => cvv = value!,
              ),
              vGap(24),
              DefaultToggle(
                value: isDefault,
                label: S.of(context).set_as_default_payment_method,
                subtitle: S.of(context).use_this_payment_method_for_checkout,
                onChanged: (value) {
                  setState(() => isDefault = value);
                },
              ),
              vGap(24),
              SecurityInfo(),
              vGap(24),
              ElevatedButton(
                onPressed: _handleSave,
                child: Text(S.of(context).save_card),
              ),
              vGap(12),
            ],
          ),
        ),
      ),
    );
  }
}
