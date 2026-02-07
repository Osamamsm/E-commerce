import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/review_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/step_indicator.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: StepIndicator(
            currentStep: currentStep,
            steps: const ['Address', 'Payment', 'Review'],
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: currentStep,
            children: [
              AddressStep(
                addresses: TestingLists.addresses,
                onContinue: () {
                  setState(() {
                    currentStep = 1;
                  });
                },
              ),
              PaymentStep(),
              ReviewStep(),
            ],
          ),
        ),
      ],
    );
  }
}
