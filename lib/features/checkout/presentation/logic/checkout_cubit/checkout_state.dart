import 'package:e_commerce/core/helpers/testing_lists.dart';

class CheckoutState {
  final String? selectedAddressId;
  final String? selectedPaymentMethodId;
  final List<OrderItem>? orderItems;

  CheckoutState({
    this.selectedAddressId,
    this.selectedPaymentMethodId,
    this.orderItems,
  });

  CheckoutState copyWith({
    String? selectedAddressId,
    String? selectedPaymentMethodId,
    List<OrderItem>? orderItems,
  }) {
    return CheckoutState(
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      selectedPaymentMethodId: selectedPaymentMethodId ?? this.selectedPaymentMethodId,
      orderItems: orderItems ?? this.orderItems,
    );
  }
}

