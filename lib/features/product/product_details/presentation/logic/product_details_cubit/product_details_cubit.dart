import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductRepo _productRepo;

  ProductDetailsCubit(this._productRepo) : super(ProductDetailsInitial());

  Future<void> loadProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    final details = await _productRepo.getProductDetails(productId);
    details.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) => emit(ProductDetailsLoaded(product: product)),
    );
  }
}
