import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/payment/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: TestingLists.paymentCardModels.length,
      separatorBuilder: (context, index) => vGap(16),
      itemBuilder: (context, index) {
        return PaymentCard(paymentMethod: TestingLists.paymentCardModels[index]);
      },
    );
  }
}
