import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/payment/presentation/views/add_payment_method_view.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_methods_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  static const String routeName = '/payment-methods-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).payment_methods,
      actionWidgets: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AddPaymentMethodView.routeName);
          },
          icon: const Icon(Icons.add, size: 30),
        ),
      ],
      child: const PaymentMethodsViewBody(),
    );
  }
}
