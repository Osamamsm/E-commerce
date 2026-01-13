import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/payment/presentation/widgets/add_payment_method_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodView extends StatelessWidget {
  const AddPaymentMethodView({super.key});

  static String routeName = '/add-payment-method-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).add_payment_method,
      child:  AddPaymentMethodViewBody(),
    );
  }
}