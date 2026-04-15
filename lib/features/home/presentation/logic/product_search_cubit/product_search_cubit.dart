import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductSearchCubit extends Cubit<ProductSearchState> {
  final ProductRepo _productRepo;
  ProductSearchCubit(this._productRepo) : super(ProductSearchInitial());

  Future<void> searchProducts(String query) async {
    emit(ProductSearchLoading());
    final result = await _productRepo.searchProducts(query);
    result.fold(
      (failure) => emit(ProductSearchError(failure.toString())),
      (products) => emit(ProductSearchLoaded(products)),
    );
  }
}
