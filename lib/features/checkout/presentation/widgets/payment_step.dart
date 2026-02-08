import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/continue_button.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_selectable_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentStep extends StatefulWidget {
  final List<PaymentMethod> paymentMethods;
  final VoidCallback onContinue;
  final VoidCallback onBack;

  const PaymentStep({
    super.key,
    required this.paymentMethods,
    required this.onContinue,
    required this.onBack,
  });

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  String selectedPaymentId = 'card';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).payment_method,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFF6B6B7B),
                          letterSpacing: 1.2,
                        ),
                      ),
                      vGap(16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList.separated(
                  itemCount: widget.paymentMethods.length,
                  itemBuilder: (context, index) {
                    final payment = widget.paymentMethods[index];
                    return PaymentSelectableCard(
                      payment: payment,
                      isSelected: payment.id == selectedPaymentId,
                      onTap: () {
                        context.read<CheckoutCubit>().setPaymentMethodId(
                          payment.id,
                        );
                        setState(() {
                          selectedPaymentId = payment.id;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => vGap(16),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ContinueButton(
              label: S.of(context).continue_to_review,
              onPressed: widget.onContinue,
            ),
            TextButton(
              onPressed: widget.onBack,
              child: Text(
                S.of(context).back_to_address,
                style: TextStyle(color: Color(0xFF9B9BA5), fontSize: 14),
              ),
            ),
            vGap(8),
          ],
        ),
      ],
    );
  }
}
