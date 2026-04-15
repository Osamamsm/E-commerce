import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  final ProductRepo _productRepo;
  GetProductsByCategoryCubit(this._productRepo)
    : super(GetProductsByCategoryInitial());

  Future<void> getProductsByCategory(String category) async {
    emit(GetProductsByCategoryLoading());
    final result = await _productRepo.getProductsByCategory(category);
    result.fold(
      (failure) => emit(GetProductsByCategoryError(failure.toString())),
      (products) => emit(GetProductsByCategoryLoaded(products)),
    );
  }
}
