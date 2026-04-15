import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductFeedCubit extends Cubit<ProductFeedState> {
  final ProductRepo _productRepo;
  ProductFeedCubit(this._productRepo) : super(ProductFeedInitial());

  Future<void> loadProducts() async {
    emit(ProductFeedLoading());
    final result = await _productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFeedError(failure.toString())),
      (products) => emit(ProductFeedLoaded(products)),
    );
  }
}
