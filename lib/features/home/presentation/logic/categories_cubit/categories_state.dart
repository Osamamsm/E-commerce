
import 'package:e_commerce/features/product/data/models/category.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<Category> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
