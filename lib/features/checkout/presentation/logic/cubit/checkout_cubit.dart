import 'package:e_commerce/features/checkout/presentation/logic/cubit/checkout_state.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/checkout_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  late String addressId;
  late String paymentMethodId;
  late List<OrderItem> orderItems;

  void setAddressId(String addressId) {
    emit(CheckoutInitial());
    this.addressId = addressId;
  }

  String get getAddressId => addressId;

  String get getPaymentMethodId => paymentMethodId;

  List<OrderItem> get getOrderItems => orderItems;

  void setPaymentMethodId(String paymentMethodId) {
    emit(CheckoutInitial());
    this.paymentMethodId = paymentMethodId;
  }

  void setOrderItems(List<OrderItem> orderItems) {
    emit(CheckoutInitial());
    this.orderItems = orderItems;
  }
}
