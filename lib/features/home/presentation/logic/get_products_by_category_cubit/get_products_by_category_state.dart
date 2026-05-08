import 'package:e_commerce/features/product/data/models/product.dart';

class GetProductsByCategoryState {}

class GetProductsByCategoryInitial extends GetProductsByCategoryState {}

class GetProductsByCategoryLoading extends GetProductsByCategoryState {}

class GetProductsByCategoryLoaded extends GetProductsByCategoryState {
  final List<Product> products;
  GetProductsByCategoryLoaded(this.products);
}

class GetProductsByCategoryError extends GetProductsByCategoryState {
  final String message;
  GetProductsByCategoryError(this.message);
}
