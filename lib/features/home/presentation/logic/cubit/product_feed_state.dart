import 'package:e_commerce/features/product/data/models/product.dart';

class ProductFeedState {}

final class ProductFeedInitial extends ProductFeedState {}

final class ProductFeedLoading extends ProductFeedState {}

final class ProductFeedLoaded extends ProductFeedState {
  final List<Product> products;

  ProductFeedLoaded(this.products);
}

final class ProductFeedError extends ProductFeedState {
  final String message;

  ProductFeedError(this.message);
}
