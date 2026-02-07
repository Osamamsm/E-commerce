import 'package:e_commerce/core/helpers/testing_lists.dart';
import 'package:e_commerce/features/checkout/presentation/logic/cubit/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit()
    : super(
        CheckoutState(
          selectedAddressId: null,
          selectedPaymentMethodId: null,
          orderItems: null,
        ),
      );

  void initDefaults({
    required List<Address> addresses,
    required List<PaymentMethod> paymentMethods,
    required List<OrderItem> orderItems,
  }) {
    emit(
      state.copyWith(
        selectedAddressId: addresses.first.id,
        selectedPaymentMethodId: paymentMethods.first.id,
        orderItems: orderItems,
      ),
    );
  }

  void setAddressId(String addressId) {
    emit(state.copyWith(selectedAddressId: addressId));
  }

  void setPaymentMethodId(String paymentMethodId) {
    emit(state.copyWith(selectedPaymentMethodId: paymentMethodId));
  }

  void setOrderItems(List<OrderItem> orderItems) {
    emit(state.copyWith(orderItems: orderItems));
  }
}
