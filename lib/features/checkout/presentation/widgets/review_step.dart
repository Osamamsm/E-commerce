import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/__price_summary.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_summary.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/order_item_card.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/payment_summary.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReviewStep extends StatelessWidget {
  final Address selectedAddress;
  final PaymentMethod selectedPayment;
  final List<OrderItem> orderItems;
  final VoidCallback onBack;

  const ReviewStep({
    super.key,
    required this.selectedAddress,
    required this.selectedPayment,
    required this.orderItems,
    required this.onBack,
  });

  double get subtotal => orderItems.fold(0, (sum, item) => sum + item.price);
  double get shipping => 15.00;
  double get tax => subtotal * 0.1; // 10% tax
  double get total => subtotal + shipping + tax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).delivery_address,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xFF6B6B7B),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                AddressSummary(address: selectedAddress),
                vGap(24),
                Text(
                  S.of(context).payment_method,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xFF6B6B7B),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(12),
                PaymentSummary(payment: selectedPayment),
                vGap(24),
                Text(
                  S.of(context).order_summary,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xFF6B6B7B),
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(16),
                ...orderItems.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: OrderItemCard(item: item),
                  ),
                ),
                vGap(8),
                PriceSummary(
                  subtotal: subtotal,
                  shipping: shipping,
                  tax: tax,
                  total: total,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(S.of(context).place_order),
              ),
              TextButton(
                onPressed: onBack,
                child: Text(
                  S.of(context).back_to_payment,
                  style: TextStyle(color: Color(0xFF9B9BA5), fontSize: 14),
                ),
              ),
              vGap(8),
            ],
          ),
        ),
      ],
    );
  }
}
