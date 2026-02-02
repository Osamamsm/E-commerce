import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static String routeName = "/checkout";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).checkout,
      child: CheckoutViewBody(),
    );
  }
}
