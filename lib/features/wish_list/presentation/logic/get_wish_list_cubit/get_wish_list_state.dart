
import 'package:e_commerce/features/product/data/models/product.dart';

sealed class GetWishListState {
  const GetWishListState();

  
}

final class GetWishListInitial extends GetWishListState {}

final class GetWishListLoading extends GetWishListState {}

final class GetWishListSuccess extends GetWishListState {
  final List<Product> products;

  const GetWishListSuccess(this.products);
}

final class GetWishListFailure extends GetWishListState {
  final String message;

  const GetWishListFailure(this.message);
}
