import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/review_step.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/step_indicator.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutFlowCubit, int>(
      builder: (context, step) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: StepIndicator(
                currentStep: step,
                steps: [
                  S.of(context).address_step,
                  S.of(context).payment_step,
                  S.of(context).review_step,
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: step,
                children: [
                  AddressStep(addresses: TestingLists.addresses),
                  PaymentStep(paymentMethods: TestingLists.paymentMethods),
                  ReviewStep(
                    selectedAddress: TestingLists.addresses.firstWhere(
                      (a) =>
                          a.id ==
                          context.read<CheckoutCubit>().state.selectedAddressId,
                    ),
                    selectedPayment: TestingLists.paymentMethods.firstWhere(
                      (p) =>
                          p.id ==
                          context
                              .read<CheckoutCubit>()
                              .state
                              .selectedPaymentMethodId,
                    ),
                    orderItems: context.read<CheckoutCubit>().state.orderItems!,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
