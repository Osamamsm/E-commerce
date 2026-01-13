import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_methods_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  static const String routeName = '/payment-methods-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).payment_methods,
      child: PaymentMethodsViewBody(),
    );
  }
}
